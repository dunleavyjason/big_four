\connect auditors

-- tickers

SELECT ticker, name, exchange, sicsector, sicindustry, famasector,
       famaindustry, sector, industry, scalemarketcap, scalerevenue, relatedtickers, location
FROM tickers
WHERE isdelisted='N' AND currency='USD' AND _table='SF1';

-- category may be duplicate value
-- check for duplicates

SELECT ticker, count(*)
FROM tickers
WHERE isdelisted='N' AND currency='USD' AND _table='SF1'
GROUP BY ticker
HAVING count(*) > 1;
-- no duplicates


-- create view
CREATE VIEW ticker_final AS (
SELECT ticker, name, exchange, sicsector, sicindustry, famasector,
       famaindustry, sector, industry, scalemarketcap, scalerevenue, relatedtickers, location
FROM tickers
WHERE isdelisted='N' AND currency='USD' AND _table='SF1');


-- SF1

SELECT ticker, calendardate, reportperiod, assets, capex, ncfbus, ncfinv, ncff, ncfdebt,
       ncfcommon, ncfdiv, ncfi, ncfo, liabilities, debtusd, ebitdausd, netinccmnusd,
       equityusd, revenueusd, cashnequsd, marketcap, ev
FROM sf1
WHERE dimension='ARY';

CREATE VIEW sf1_final AS(
SELECT ticker, calendardate, reportperiod, assets, capex, ncfbus, ncfinv, ncff, ncfdebt,
       ncfcommon, ncfdiv, ncfi, ncfo, liabilities, debtusd, ebitdausd, netinccmnusd,
       equityusd, revenueusd, cashnequsd, marketcap, ev
FROM sf1
WHERE dimension='ARY');

-- join sf1_final and ticker_final, create view
CREATE VIEW sf1_ticker AS(
SELECT sf1_final.*, ticker_final.name, ticker_final.exchange, ticker_final.sicsector,
       ticker_final.sicindustry, ticker_final.famasector, ticker_final.famaindustry,
       ticker_final.sector, ticker_final.industry, ticker_final.scalemarketcap,
       ticker_final.scalerevenue, ticker_final.relatedtickers, ticker_final.location
FROM sf1_final
INNER JOIN ticker_final ON sf1_final.ticker = ticker_final.ticker);

-- firm_filings

-- create view splitting tickers into separate columns, filter for only regular filing types
CREATE VIEW firm_filings_beg AS(
SELECT firm_name,
    firm_country,
    audit_report_type,
    issuer_id,
    issuer_name,
    split_part(issuer_ticker::TEXT, ';' , 1) AS ticker_1,
    split_part(issuer_ticker::TEXT, ';' , 2) AS ticker_2,
    split_part(issuer_ticker::TEXT, ';' , 3) AS ticker_3,
    split_part(issuer_ticker::TEXT, ';' , 4) AS ticker_4,
    split_part(issuer_ticker::TEXT, ';' , 5) AS ticker_5,
    firm_issuing_country,
    firm_issuing_city,
    firm_issuing_state,
    is_multiple_audit_period,
    filing_date
FROM firm_filings
WHERE audit_report_type='Issuer, other than Employee Benefit Plan or Investment Company');

-- create view identifying only most recent filing
CREATE VIEW firm_filings_inter AS(
SELECT firm_name,
    firm_country,
    audit_report_type,
    issuer_id,
    issuer_name,
    ticker_1,
    ticker_2,
    ticker_3,
    ticker_4,
    ticker_5,
    firm_issuing_country,
    firm_issuing_city,
    firm_issuing_state,
    is_multiple_audit_period,
    filing_date,
    MAX(filing_date) OVER (PARTITION BY ticker_1) AS last_filing_date
FROM firm_filings_beg);

-- create view filtering for only most recent filing
CREATE VIEW firm_filings_final AS(
SELECT firm_name,
    firm_country,
    issuer_name,
    ticker_1,
    ticker_2,
    ticker_3,
    ticker_4,
    ticker_5,
    firm_issuing_country,
    firm_issuing_city,
    firm_issuing_state,
    last_filing_date
FROM firm_filings_inter
WHERE last_filing_date=filing_date);


--join firm_filings and sf1_ticker
CREATE VIEW sf1_ticker_filings AS(
SELECT *
FROM sf1_ticker
INNER JOIN firm_filings_final ON (sf1_ticker.ticker = firm_filings_final.ticker_1 OR
                                  sf1_ticker.ticker = firm_filings_final.ticker_2 OR
                                  sf1_ticker.ticker = firm_filings_final.ticker_3 OR
                                  sf1_ticker.ticker = firm_filings_final.ticker_4 OR
                                  sf1_ticker.ticker = firm_filings_final.ticker_5)
);

-- create table to read into pandas
CREATE TABLE export_table AS
  SELECT *
  FROM sf1_ticker_filings;




