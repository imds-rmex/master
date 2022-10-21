create table rmex_bidder_d as 
(
	select 
		bidder_name as bidder_code
	,	case bidder_name
	when 'RO2'		then 'Unruly'
	when 'IX'       then 'Index Exchange'
	when 'VZM'      then 'Yahoo'
	when 'BSW'      then 'Bidswitch'
	when 'OAPN'     then 'Xander'
	when 'MFUSE2'   then 'MobileFuse'
	when 'TTD'      then 'The Trade Desk'
	when 'UCX'      then 'UC Funnel'
	when 'CVST'     then 'Epsilon'
	when 'CR'       then 'Criteo'
	when 'ID'       then 'Improve Digital'
	when 'TLFT'     then 'TripleLift'
	when 'SPTX'     then 'SpotX'
	when 'MN'       then 'Media.net'
	when 'BEES'     then 'Beeswax'
	when 'OPM'      then 'PubMatic'
	when 'OT'       then 'OneTag'
	when 'RP'       then 'Magnite'
	when 'OPXR'     then 'OpenX'
	when 'TTX'      then '33 Across'
	end as bidder_name
	from rtb_daily
	where (TIMESTAMP 'epoch' + dt * INTERVAL '1 Second ') > sysdate - 367
)
;
