create table rmex_demand_domain_d 
as
(
select distinct domain from 
rmex_demand_daily
)
;

grant select on rmex_demand_domain_d to power_bi_gw;
grant select on rmex_demand_domain_d to hkummari;
