CREATE OR REPLACE STAGE NIFTY_DB.EXTERNAL_STAGES.NIFTY_STAGE
STORAGE_INTEGRATION = NIFTY_S3_INT
URL = 's3://niftyfiftys3bucket/NiftyStocks/'
FILE_FORMAT = NIFTY_DB.FILE_FORMATS.STOCKS_CSV_FORMAT;

DESC STAGE NIFTY_DB.EXTERNAL_STAGES.NIFTY_STAGE;


SELECT 
T.$1 AS DATE,
T.$2 AS SYMBOL,
T.$3 AS SERIES,
T.$4 AS PREV_CLOSE,
T.$5 AS OPEN,
T.$6 AS HIGH,
T.$7 AS LOW,
T.$8 AS LAST,
T.$9 AS CLOSE,
T.$10 AS VWAP,
T.$11 AS VOLUME,
T.$12 AS TURNOVER,
T.$13 AS TRADES,
T.$14 AS DELIVERABLE_VOLUME,
T.$15 AS DELIVERABLE_PCT
FROM @NIFTY_DB.EXTERNAL_STAGES.NIFTY_STAGE T 
LIMIT 10;


LIST @NIFTY_DB.EXTERNAL_STAGES.NIFTY_STAGE;


