select 
	 row_wid
	,to_date(row_wid, 'YYYYMMDD') 
from rmex_date_d
where day_dt  is null
;
update rmex_date_d 
set calendar_date = to_char(row_wid, 'YYYY-MM-DD')::date
where day_dt is null
;
commit
;
delete from rmex_date_d 
where day_dt is null
;
select count(*), per_name_month 
from rmex_date_d rdd
where per_name_year = 2022
group by per_name_month
;
delete from rmex_date_d 
where calendar_date = '1901-01-01'
;
select month_ago_wid  , day_dt, per_name_week  from rmex_date_d rdd 
where per_name_month = '2022 / 06'
--order by ROW_WID
;
select 
to_date('07-SEP-22 00:00:00','DD-MM-YYYY HH24:MI:SS')

