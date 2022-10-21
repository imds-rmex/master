-- previously ctas'd to created rmex_date_base_d off original rmex_date_d
-- now creating rmex_date_d based off base joined to fact to limit dates in pbi
-- there seemed to be an issue in pbi with doing this as a view
-- view so we don't have to schedule a refresh; convert to table as needed if pbi chokes loading off view

CREATE view public.rmex_date_d
AS 
(
SELECT 
distinct
	a.row_wid 
,	a.calendar_date 
,	a.cal_half 
,	a.cal_month 
,	a.cal_qtr 
,	a.cal_trimester 
,	a.cal_week 
,	a.cal_year 
,	a.day_ago_dt 
,	a.day_ago_wid 
,	a.day_dt 
,	a.w_day_code 
,	a.day_of_month 
,	a.day_of_week 
,	a.day_of_year 
,	a.half_ago_dt
,	a.half_ago_wid 
,	a.month_ago_dt 
,	a.month_ago_wid 
,	a.w_month_code 
,	a.per_name_half
,	a.per_name_month 
,	a.per_name_qtr 
,	a.per_name_ter 
,	a.per_name_week 
,	a.per_name_offset_wk 
,	a.per_name_year 
,	a.quarter_ago_dt 
,	a.quarter_ago_wid 
,	a.trimester_ago_dt 
,	a.trimester_ago_wid 
,	a.week_ago_dt 
,	a.week_ago_wid 
,	a.year_ago_dt 
,	a.year_ago_wid 
,	a.m_end_cal_dt_wid 
,	a.m_strt_cal_dt_wid 
,	a.cal_week_end_dt_wid 
,	a.cal_week_start_dt_wid 
,	a.cal_qtr_end_dt_wid 
,	a.cal_qtr_start_dt_wid 
,	a.cal_year_end_dt_wid 
,	a.cal_year_start_dt_wid 
,	a.fst_day_cal_wk_flg 
,	a.last_day_cal_wk_flg 
,	a.fst_day_cal_mnth_flg 
,	a.last_day_cal_mnth_flg 
,	a.fst_day_cal_qtr_flg 
,	a.last_day_cal_qtr_flg 
,	a.fst_day_cal_year_flg 
,	a.last_day_cal_year_flg 
,	a.cal_year_start_dt 
,	a.cal_year_end_dt 
,	a.cal_month_wid 
,	a.cal_qtr_wid 
,	a.cal_year_wid 
,	a.wc_cal_week_start_dt 
FROM 
		rmex_date_base_d a
JOIN 	rmex_demand_daily b ON a.row_wid = b.date_key
)
;

grant select on public.rmex_date_d to power_bi_gw;
grant select on public.rmex_date_d to hkummari;