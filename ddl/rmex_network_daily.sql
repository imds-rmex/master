drop table rmex_network_daily;
create table rmex_network_daily as -- Supply
(

   with a as (
	select 
 		(TIMESTAMP 'epoch' + dt * INTERVAL '1 Second ') as formatted_dt
		,domain
		,impressions
		,revenue
		,viewability_score_count
		,sold_impressions
		,pub_earnings
		,pub_id 
		,pub_code 
	from network_daily
	where formatted_dt > sysdate - 367
   )   

   select 
        to_char(formatted_dt, 'YYYYMMDD')::int as date_key
       ,domain
       ,pub_id as publisher_id
       ,pub_code as publisher_code
       ,sum(impressions) impressions
       ,sum(revenue) revenue
	   ,sum(viewability_score_count) viewability_score_count
       ,sum(sold_impressions) sold_impressions
       ,sum(pub_earnings) pub_earnings
   from a
   group by date_key, domain, pub_id, pub_code

)
;

grant select on public.rmex_network_daily to hkummari;
grant select on public.rmex_network_daily to power_bi_gw;