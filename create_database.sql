CREATE DATABASE auditors;

\connect auditors

CREATE TABLE actions(
    date DATE,
    action VARCHAR,
    ticker VARCHAR,
    name VARCHAR,
    value DECIMAL,
    contraticker VARCHAR,
    contraname VARCHAR
);

COPY actions(date, action, ticker, name, value, contraticker, contraname)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/actions.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE daily(
    ticker VARCHAR,
    date DATE,
    lastupdated DATE,
    ev DECIMAL,
    evebit DECIMAL,
    evebitda DECIMAL,
    marketcap DECIMAL,
    pb DECIMAL,
    pe DECIMAL,
    ps DECIMAL
);

COPY daily(ticker, date, lastupdated, ev, evebit, evebitda, marketcap, pb, pe, ps)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/daily.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE events(
    ticker VARCHAR,
    date DATE,
    eventcodes VARCHAR
);

COPY events(ticker, date, eventcodes)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/events.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE indicators(
    _table VARCHAR,
    indicator VARCHAR,
    isfilter VARCHAR,
    isprimarykey VARCHAR,
    title VARCHAR,
    description VARCHAR,
    unittype VARCHAR
);

COPY indicators(_table, indicator, isfilter, isprimarykey, title, description, unittype)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/indicators.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE sf1(
    ticker VARCHAR,
    dimension VARCHAR,
    calendardate DATE,
    reportperiod DATE,
    lastupdated DATE,
    assets NUMERIC,
    capex NUMERIC,
    ncfbus NUMERIC,
    ncfinv NUMERIC,
    ncff NUMERIC,
    ncfdebt NUMERIC,
    ncfcommon NUMERIC,
    ncfdiv NUMERIC,
    ncfi NUMERIC,
    ncfo NUMERIC,
    liabilities NUMERIC,
    debtusd NUMERIC,
    ebitdausd NUMERIC,
    netinccmnusd NUMERIC,
    equityusd NUMERIC,
    revenueusd NUMERIC,
    cashnequsd NUMERIC,
    marketcap NUMERIC,
    ev NUMERIC
);

COPY sf1(ticker, dimension, calendardate, reportperiod, lastupdated,
       assets, capex, cashnequsd, debtusd, ebitdausd, equityusd,
       ev, liabilities, marketcap, ncfbus, ncfcommon, ncfdebt,
       ncfdiv, ncff, ncfi, ncfinv, ncfo, netinccmnusd,
       revenueusd
)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/sf1_columns.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE sp500(
    date DATE,
    action VARCHAR,
    ticker VARCHAR,
    name VARCHAR,
    contraticker VARCHAR,
    contraname VARCHAR,
    note VARCHAR
);

COPY sp500(date, action, ticker, name, contraticker, contraname, note)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/sp500.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE tickers(
    _table VARCHAR,
    permaticker VARCHAR,
    ticker VARCHAR,
    name VARCHAR,
    exchange VARCHAR,
    isdelisted VARCHAR,
    category VARCHAR,
    cusips VARCHAR,
    siccode VARCHAR,
    sicsector VARCHAR,
    sicindustry VARCHAR,
    famasector VARCHAR,
    famaindustry VARCHAR,
    sector VARCHAR,
    industry VARCHAR,
    scalemarketcap VARCHAR,
    scalerevenue VARCHAR,
    relatedtickers VARCHAR,
    currency VARCHAR,
    location VARCHAR,
    lastupdated DATE,
    firstadded DATE,
    firstpricedate DATE,
    lastpricedate DATE,
    firstquarter DATE,
    lastquarter DATE,
    secfilings VARCHAR,
    companysite VARCHAR
);

COPY tickers(_table,
    permaticker,
    ticker,
    name,
    exchange,
    isdelisted,
    category,
    cusips,
    siccode,
    sicsector,
    sicindustry,
    famasector,
    famaindustry,
    sector,
    industry,
    scalemarketcap,
    scalerevenue,
    relatedtickers,
    currency,
    location,
    lastupdated,
    firstadded,
    firstpricedate,
    lastpricedate,
    firstquarter,
    lastquarter,
    secfilings,
    companysite)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/tickers.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE firm_filings(
    firm_name VARCHAR,
    firm_country VARCHAR,
    audit_report_type VARCHAR,
    issuer_id DECIMAL,
    issuer_name VARCHAR,
    issuer_ticker VARCHAR,
    firm_issuing_country VARCHAR,
    firm_issuing_city VARCHAR,
    firm_issuing_state VARCHAR,
    is_multiple_audit_period BOOLEAN,
    signed_date DATE,
    filing_date DATE
);

COPY firm_filings(firm_name,
    firm_country,
    audit_report_type,
    issuer_id,
    issuer_name,
    issuer_ticker,
    firm_issuing_country,
    firm_issuing_city,
    firm_issuing_state,
    is_multiple_audit_period,
    signed_date,
    filing_date)
FROM '/Users/dunleavyjason/Documents/Metis/auditors/auditor_database_files/firm_filings_columns.csv'
DELIMITER ','
CSV HEADER;

