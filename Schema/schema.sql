-- Tạo database
create database teen_mental_health_analysis

-- Tạo table
create table teen_mental_health_analysis(
age int not null,
gender varchar(20) not null,
daily_social_media_hours float not null,
platform_usage varchar(50) not null,
sleep_hours float not null,
screen_time_before_sleep float not null,
academic_performance float not null,
physical_activity float not null,
social_interaction_level varchar(50) not null,
stress_level int not null,
anxiety_level int not null,
addiction_level int not null,
depression_label int not null
);

-- Kiểm tra dữ liệu và bảng
select * from teen_mental_health_analysis