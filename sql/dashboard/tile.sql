
--  stock chart of company.
SELECT CLOSE, DATE, SYMBOL
FROM NIFTY_DB.STAGE_TABLES.NIFTY_DATA
WHERE SYMBOL = :stock_symbol;

-- for displaying stock chart in time interval.
select close, date, symbol
from nifty_db.stage_tables.nifty_data
where date = :daterange
and symbol = :stock_symbol;

-- for checking intraday.
select volume - deliverable_volume, date
from nifty_db.stage_tables.nifty_data
where symbol = :stock_symbol
and date = :daterange;

-- for volume analysis
select volume, DATE
from nifty_db.stage_tables.nifty_data
where  symbol = :stock_symbol
and date = :daterange;