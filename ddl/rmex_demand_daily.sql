-- need to create query with date key, include date_d in pbi dataset and join there so we can make date_d as date table to get date
-- functionality working as pbi intends

--drop table rmex_demand_daily;
create table rmex_demand_daily as -- Demand
(

   with a as (
       select 
             (TIMESTAMP 'epoch' + dt * INTERVAL '1 Second ') as formatted_dt
             ,paid_impressions 
             ,revenue
             ,wins
             ,bids
             ,requests
             ,sum_bid_price
             ,viewability_score_count
             ,pub_earnings
             ,domain
             ,pub_id
             ,pub_code
       from rtb_daily -- rtb is demand
       where formatted_dt > sysdate - 367
   )   

   select 
        to_char(formatted_dt, 'YYYYMMDD')::int as date_key
       ,domain
       ,pub_id as publisher_id
       ,pub_code as publisher_code
       ,sum(paid_impressions)  paid_impressions
       ,sum(revenue) revenue
       ,sum(wins) wins
       ,sum(bids) bids
       ,sum(requests) requests
       ,sum(sum_bid_price) sum_bid_price
       ,sum(viewability_score_count) viewability_score_count
       ,sum(pub_earnings) pub_earnings
   from a
   group by date_key, domain, pub_id, pub_code
)

;

grant select on public.rmex_demand_daily to hkummari;
grant select on public.rmex_demand_daily to power_bi_gw;