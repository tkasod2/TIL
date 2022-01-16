-- DAU
select unit_id,created_at,count(device_id) as dau from (select distinct device_id, unit_id,created_at from bz_dau)
where created_at >= 'August 01, 2018'
and created_at < 'September, 01, 2018'
group by created_at,unit_id
order by created_at;

-- DAU rate with sex
-- over(partition by COL)
with t as (
select unit_id||'_'||case sex when 'M' then 'Male' else 'Female' end as u_s,created_at, count(device_id) as dau 
from (select distinct device_id, bz_dau.unit_id,created_at, b.sex from bz_dau left join bz_device b on bz_dau.device_id = b.id where b.sex is not null)
where created_at >= 'August 01, 2018'
and created_at < 'September, 01, 2018'
group by created_at,u_s)

select created_at, u_s, dau*1.0/(avg(dau) over(partition by u_s) )as dau_rate_over_avg from t

-- DAU with sex
with tb as (
select a.*, b.sex from bz_dau a
left join (select id,sex from bz_device) b on a.device_id = b.id
where b.sex is not null
)
select sex, unit_id,avg(dau) from (
select sex, unit_id,created_at,count(device_id) as dau from (select distinct device_id, unit_id,created_at, sex from tb)
where created_at >= 'August 01, 2018'
and created_at < 'September, 01, 2018'
-- and unit_id is not null
-- and unit_id = 'B'
group by created_at, sex, unit_id
order by created_at, sex, unit_id
)
group by sex, unit_id
order by unit_id, sex;


-- NRU
select unit_id,date_joined, count(id) NRU from bz_device
where date_joined >= 'August 01, 2018'
and date_joined < 'September, 01, 2018'
group by unit_id,date_joined
order by date_joined,unit_id;

-- NRU/DAU
with NRU as (
select unit_id as unitid,date_joined, count(id) nru from bz_device
where date_joined >= 'August 01, 2018'
and date_joined < 'September, 01, 2018'
group by unit_id,date_joined
order by date_joined,unit_id)

select unit_id,created_at,NRU.nru*1.0/count(device_id) as nru_over_dau
from (select distinct device_id, unit_id,created_at from bz_dau)
left join NRU
on created_at= NRU.date_joined and unit_id = NRU.unitid
where created_at >= 'August 01, 2018'
and created_at < 'September, 01, 2018'
group by created_at,unit_id, NRU.nru
order by created_at, unit_id;

-- retention rate
-- 반복문 확인 필요
select to_char(a.created_at,'YYYY-MM-DD')
,(100*count(distinct b.device_id)/cast(count(distinct a.device_id) as float)) as ret_1day
,(100*count(distinct c.device_id)/cast(count(distinct a.device_id) as float)) as ret_7days
,(100*count(distinct d.device_id)/cast(count(distinct a.device_id) as float)) as ret_15days
,(100*count(distinct e.device_id)/cast(count(distinct a.device_id) as float)) as ret_30days
from bz_dau a

left join bz_dau b
on a.device_id = b.device_id
and a.created_at = b.created_at-1

left join bz_dau c
on a.device_id = c.device_id
and a.created_at = c.created_at-7

left join bz_dau d
on a.device_id = d.device_id
and a.created_at = d.created_at-15

left join bz_dau e
on a.device_id = e.device_id
and a.created_at = e.created_at-30


where a.created_at >= 'August 1, 2018'
and a.created_at <'September 1, 2018'

group by a.created_at
order by a.created_at;

-- ROAS
select unit_id,ad_type,sum(impression_count) as imp_cnt, sum(click_count) as clk_cnt, round(sum(click_count)*100.00/(sum(impression_count)+sum(click_count)),2) as ctr_percent,
sum(spent_budget) as budget, sum(revenue) as rev, rev*1.0/budget as roas

from 
(select cost.unit_id, cost.lineitem_id, cost.impression_count, cost.click_count, cost.spent_budget, revenue.revenue, cost.ad_type,cost.name,cost_date as day
from 
(select unit_id, lineitem_id, sum(impression_count) as impression_count, sum(click_count) as click_count, sum(spent_budget) as spent_budget, b.ad_type,name,to_char(data_at,'YYYY-MM-DD') as cost_date
from bz_statistics_unit_lineitem left join bz_lineitem b on lineitem_id = b.id group by unit_id, lineitem_id, cost_date, b.name,b.ad_type) as cost 

left join (select unit_id, lineitem_id, to_char(event_time, 'YYYY-MM-DD') as ev_date, sum(event_revenue) as revenue from bz_third_party_event
group by unit_id, lineitem_id, ev_date) as revenue 

on cost.unit_id = revenue.unit_id and cost.lineitem_id =revenue.lineitem_id and cost.cost_date = revenue.ev_date
order by day,unit_id,lineitem_id
)
group by unit_id,ad_type
having budget !=0
order by unit_id;

