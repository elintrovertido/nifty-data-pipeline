create or replace table nifty_db.stage_tables.nifty_data
as
(select 
t.$1 Date,
t.$2    Symbol,
t.$3    Series,
t.$4   Prev_Close,
t.$5   Open,
t.$6    High,
t.$7   Low,
t.$8   Last,
t.$9   Close,
t.$10    VWAP,
t.$11 Volume,
t.$12   Turnover,
t.$13   Trades,
t.$14   Deliverable_Volume,
t.$15   "%Deliverble"
from @nifty_db.external_stages.nifty_stage t
where 1=0
);


desc table nifty_db.stage_tables.nifty_data;


insert into nifty_db.stage_tables.nifty_data
select 
t.$1 Date,
t.$2    Symbol,
t.$3    Series,
t.$4   Prev_Close,
t.$5   Open,
t.$6    High,
t.$7   Low,
t.$8   Last,
t.$9   Close,
t.$10    VWAP,
t.$11 Volume,
t.$12   Turnover,
t.$13   Trades,
t.$14   Deliverable_Volume,
t.$15   "%Deliverble"
from @nifty_db.external_stages.nifty_stage t;

select * from nifty_db.stage_tables.nifty_data
where trades is not null
limit 10;


select * from nifty_db.stage_tables.nifty_data
where symbol like upper('rel%')
order by date desc;



