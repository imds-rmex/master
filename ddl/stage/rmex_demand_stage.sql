create table rmex_demand_stage
as
(

       select 
             (TIMESTAMP 'epoch' + dt * INTERVAL '1 Second ') as formatted_dt
             ,sum(paid_impressions) paid_impressions 
             ,sum(revenue) revenue 
             ,sum(wins) wins
             ,sum(bids) bids
             ,sum(requests) requests
             ,sum(sum_bid_price) sum_bid_price 
             ,sum(viewability_score_count) viewability_score_count 
             ,sum(pub_earnings) pub_earnings 
             ,domain
             ,pub_id
             ,pub_code
             ,pub_name
             ,bidder_name
             ,inventory_type
             ,is_app_req
             ,device_type -- use is_app_req and device_type to create device_type_category 
             ,section_id 
             ,section_name 
       from rtb_daily
       where formatted_dt > sysdate - 367
       group by
       		  domain
             ,pub_id
             ,pub_code
             ,pub_name
             ,bidder_name
             ,inventory_type
             ,is_app_req
             ,device_type
             ,section_id 
             ,section_name 
             ,dt
)
;


-- for inventory_type, device_type we could probably put in dims and create a static key and then just put that key in the target fact with
-- a join against the dim table; cardinality is so low that don't want to flood pbi table with those text values