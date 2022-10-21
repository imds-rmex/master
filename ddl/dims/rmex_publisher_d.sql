create table rmex_publisher_d
as
(

with a as 
  (
       select 
             (TIMESTAMP 'epoch' + dt * INTERVAL '1 Second ') as formatted_dt
             ,pub_id
             ,pub_code
             ,pub_name 
       from rtb_daily
       where formatted_dt > sysdate - 367
  )

, b as 
  (
	select 
 		(TIMESTAMP 'epoch' + dt * INTERVAL '1 Second ') as formatted_dt
		,pub_id 
		,pub_code 
		,pub_name
	from network_daily
	where formatted_dt > sysdate - 367
  )
   
   select distinct
   pub_id, pub_code, pub_name
   from a

   union 

   select distinct
   pub_id, pub_code, pub_name
   from b
)
;

grant select on public.rmex_publisher_d to hkummari;
grant select on public.rmex_publisher_d to power_bi_gw;
