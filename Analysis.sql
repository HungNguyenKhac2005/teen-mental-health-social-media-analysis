-- TIẾN HÀNH PHÂN TÍCH DỮ LIỆU TÌM RA INSIGHT
-- Các hàm sử dụng để phân tích dữ liệu
 
-- Load dữ liệu lên 
select * 
from teen_mental_health_analysis
limit 15

-- Thống kê về giới tính
select 
gender,
count(gender) as total
from teen_mental_health_analysis
group by gender;

-- Thống kê về các cột numeric
create view describe_statis as
with describe_statistic as(
select
'age' as metric_name,
count(*) as total_sample,
AVG(age) as avg,
stddev_samp(age) as std,
MIN(age) as min,
PERCENTILE_CONT(0.25) within group (order by age) as Q1,
PERCENTILE_CONT(0.5) within group (order by age) as Q2,
PERCENTILE_CONT(0.75) within group (order by age) as Q3,
MAX(age) as max
from teen_mental_health_analysis
UNION all
select
'daily_social_media_hours' as metric_name,
count(*) as total_sample,
AVG(daily_social_media_hours) as avg,
stddev_samp(daily_social_media_hours) as std,
MIN(daily_social_media_hours) as min,
PERCENTILE_CONT(0.25) within group (order by daily_social_media_hours) as Q1,
PERCENTILE_CONT(0.5) within group (order by daily_social_media_hours) as Q2,
PERCENTILE_CONT(0.75) within group (order by daily_social_media_hours) as Q3,
MAX(daily_social_media_hours) as max
from teen_mental_health_analysis
union all
select
'sleep_hours' as metric_name,
count(*) as total_sample,
AVG(sleep_hours) as avg,
stddev_samp(sleep_hours) as std,
MIN(sleep_hours) as min,
PERCENTILE_CONT(0.25) within group (order by sleep_hours) as Q1,
PERCENTILE_CONT(0.5) within group (order by sleep_hours) as Q2,
PERCENTILE_CONT(0.75) within group (order by sleep_hours) as Q3,
MAX(sleep_hours) as max
from teen_mental_health_analysis
union all
select
'screen_time_before_sleep' as metric_name,
count(*) as total_sample,
AVG(screen_time_before_sleep) as avg,
stddev_samp(screen_time_before_sleep) as std,
MIN(screen_time_before_sleep) as min,
PERCENTILE_CONT(0.25) within group (order by screen_time_before_sleep) as Q1,
PERCENTILE_CONT(0.5) within group (order by screen_time_before_sleep) as Q2,
PERCENTILE_CONT(0.75) within group (order by screen_time_before_sleep) as Q3,
MAX(screen_time_before_sleep) as max
from teen_mental_health_analysis
union all
select
'academic_performance' as metric_name,
count(*) as total_sample,
AVG(academic_performance) as avg,
stddev_samp(academic_performance) as std,
MIN(academic_performance) as min,
PERCENTILE_CONT(0.25) within group (order by academic_performance) as Q1,
PERCENTILE_CONT(0.5) within group (order by academic_performance) as Q2,
PERCENTILE_CONT(0.75) within group (order by academic_performance) as Q3,
MAX(academic_performance) as max
from teen_mental_health_analysis
union all
select
'physical_activity' as metric_name,
count(*) as total_sample,
AVG(physical_activity) as avg,
stddev_samp(physical_activity) as std,
MIN(physical_activity) as min,
PERCENTILE_CONT(0.25) within group (order by physical_activity) as Q1,
PERCENTILE_CONT(0.5) within group (order by physical_activity) as Q2,
PERCENTILE_CONT(0.75) within group (order by physical_activity) as Q3,
MAX(physical_activity) as max
from teen_mental_health_analysis
union all
select
'stress_level' as metric_name,
count(*) as total_sample,
AVG(stress_level) as avg,
stddev_samp(stress_level) as std,
MIN(stress_level) as min,
PERCENTILE_CONT(0.25) within group (order by stress_level) as Q1,
PERCENTILE_CONT(0.5) within group (order by stress_level) as Q2,
PERCENTILE_CONT(0.75) within group (order by stress_level) as Q3,
MAX(stress_level) as max
from teen_mental_health_analysis
union all
select
'anxiety_level' as metric_name,
count(*) as total_sample,
AVG(anxiety_level) as avg,
stddev_samp(anxiety_level) as std,
MIN(anxiety_level) as min,
PERCENTILE_CONT(0.25) within group (order by anxiety_level) as Q1,
PERCENTILE_CONT(0.5) within group (order by anxiety_level) as Q2,
PERCENTILE_CONT(0.75) within group (order by anxiety_level) as Q3,
MAX(anxiety_level) as max
from teen_mental_health_analysis
union all
select
'addiction_level' as metric_name,
count(*) as total_sample,
AVG(addiction_level) as avg,
stddev_samp(addiction_level) as std,
MIN(addiction_level) as min,
PERCENTILE_CONT(0.25) within group (order by addiction_level) as Q1,
PERCENTILE_CONT(0.5) within group (order by addiction_level) as Q2,
PERCENTILE_CONT(0.75) within group (order by addiction_level) as Q3,
MAX(addiction_level) as max
from teen_mental_health_analysis
)
select * from describe_statistic;

-- Thống kê về mạng xã hội
select platform_usage,
count(platform_usage) as total
from teen_mental_health_analysis
group by platform_usage;

-- Thống kê về trầm cảm
select depression_label,
count(depression_label) as total
from teen_mental_health_analysis
group by depression_label;

-- Phân tích mức độ phân hóa của daily_social_media_hours và addiction_level theo giới tính và nhóm độ tuổi
create view social_media_addiction_by_gender_age_group as
with age_group_table as(
select gender,daily_social_media_hours, addiction_level,
case
	when age >=13 and age < 15 then '13-15'
	when age>=15 and age < 18 then '15-18'
	when age>=18 then '18+'
end as age_group
from teen_mental_health_analysis
)

select gender, age_group,
ROUND(AVG(daily_social_media_hours)::numeric,2) as avg_daily_social_media_hours,
PERCENTILE_CONT(0.5) within group (order by daily_social_media_hours) as median_daily_social_media_hours,
ROUND(AVG(addiction_level)::numeric,2) as avg_addiction_level,
PERCENTILE_CONT(0.5) within group (order by addiction_level) as median_addiction_level
from age_group_table
group by gender, age_group;

select * from social_media_addiction_by_gender_age_group;

-- Phân tích mối tương quan giữa các loại mạng xã hội sử dụng với kết quả học tập, chỉ số căng thằng
create view academic_anxiety_summary_by_platform_usage as
select platform_usage,
count(*) as total,
round(AVG(academic_performance)::numeric, 2) as avg_academic_performance,
PERCENTILE_CONT(0.5) within group (order by academic_performance) as median_academic_performance,
round(AVG(anxiety_level)::numeric, 2) as avg_anxiety_level,
PERCENTILE_CONT(0.5) within group (order by anxiety_level) as median_anxiety_level
from teen_mental_health_analysis
group by platform_usage;

select * from academic_anxiety_summary_by_platform_usage;

-- Phân tích mối tương quan giữa việc thời gian sử dụng điện thoại trước khi ngủ với thời gian ngủ
select 
corr(screen_time_before_sleep, sleep_hours) as correlation
from teen_mental_health_analysis;

-- Phân tích mối tương quan giữa mức độ tương tác xã hội và thời gian sử dụng mạng xã hội hàng ngày 
create view social_media_usage_summary_by_social_interaction_level as
select social_interaction_level,
count(*) as total,
SUM(daily_social_media_hours) as total_daily_social_media_hours,
round(AVG(daily_social_media_hours)::numeric, 2) as avg_daily_social_media_hours,
PERCENTILE_CONT(0.5) within group (order by daily_social_media_hours) as median_daily_social_media_hours
from teen_mental_health_analysis
group by social_interaction_level;

select * from social_media_usage_summary_by_social_interaction_level;

-- Phân tích mối tương qan giữa sleep_hours, daily_social_media_hours và addiction_level ảnh hưởng như nào đến anxiety_level
select 
corr(sleep_hours, anxiety_level) as corr_anxiety_level_sleep_hours,
corr(daily_social_media_hours, anxiety_level) as corr_anxiety_level_daily_social_media_hours,
corr(addiction_level, anxiety_level) as corr_anxiety_level_addiction_level
from teen_mental_health_analysis;

-- Phân tích vai trò của hoạt động thể chất
create view stress_analysis_by_behavior_groups as
with activity_social_groups as (
select physical_activity, daily_social_media_hours,stress_level,
case
	when daily_social_media_hours < 2.8 then 'Dùng ít'
	when daily_social_media_hours >=2.8 and daily_social_media_hours <= 6.3 then 'Dùng trung bình'
	when daily_social_media_hours > 6.3 then 'dùng nhiều'
end as social_media_hours_group,
case
	when physical_activity < 0.5 then 'Tập ít'
	when physical_activity >=0.5 and physical_activity <= 1.5 then 'tập trung bình'
	when physical_activity > 1.5 then 'tập nhiều'
end as physical_activity_group
from teen_mental_health_analysis
)

select social_media_hours_group, physical_activity_group,
count(*) as total,
round(AVG(stress_level)::numeric, 2) as avg_stress_level,
PERCENTILE_CONT(0.5) within group (order by stress_level) as median_stress_level
from activity_social_groups
group by social_media_hours_group, physical_activity_group;

select * from stress_analysis_by_behavior_groups;

-- Phân tích về chân dung nhóm rủi do
select * 
from teen_mental_health_analysis
where sleep_hours < 5 and anxiety_level > 7 and stress_level>7;

-- Phân tích tìm kiếm ngưỡng an toàn
with hourly_stats as(
select 
floor(daily_social_media_hours) as hour_daily,
count(*) as total_student,
round(AVG(academic_performance)::numeric, 2) as avg_academic_performance,
PERCENTILE_CONT(0.5) within group (order by academic_performance) as median_academic_performance
from teen_mental_health_analysis
group by floor(daily_social_media_hours)
order by floor(daily_social_media_hours) desc
)

select
hour_daily::numeric || '-' || (hour_daily::numeric + 1) || ' hour' as usage_duration,
total_student,
avg_academic_performance,
avg_academic_performance - lag(avg_academic_performance) over(order by hour_daily::numeric desc) as performance_drop
from hourly_stats;

-- Phân tích những người bị trầm cảm 
select * 
from teen_mental_health_analysis
where depression_label = 1;
















