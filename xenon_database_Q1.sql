#1st Question
#(a)
create table sap(
Alert_id int  primary key,
turbine_id int ,
Alert_start_date date ,
Alert_end_date date ,
Farm_name varchar(50) ,
Fail_component varchar(50) ,
fail_window int ,
Fail_within_fail_window varchar(20) ,
Fail_within_ninty_days varchar(20) ,
fn_check_gen varchar(20) 
);

COPY sap FROM 'D:/turbine.csv' delimiter ',' CSV HEADER;

select * from sap;

#b
select count(*) from sap where turbine_id isnull;

#c
select count(*) as fail_window into fail_window from sap where Fail_within_fail_window='yes';

#d
select count(*) as non_pending into non_pending from sap where Fail_within_fail_window='yes' or Fail_within_fail_window='no';

#e
select count(*) as TP into tp from sap where Fail_within_ninty_days='yes';

#f
select count(*) as FN from sap where Fn_check_gen='yes';

#g
select (
(select non_pending from non_pending)
-
(select tp from tp)
) as FP;

#h
select (
(((select tp from tp)*100)/(select cast (non_pending as float) from non_pending))
) as precision_percentage;

select non_pending from non_pending;
select tp from tp;

#i
select (
(((select fail_window from fail_window)*100)/(select CAST (non_pending AS float) from non_pending))
) as fail_window_percentage;

select fail_window from fail_window;
select non_pending from non_pending;


#j
select (
(((select tp from tp)*100.0)/(select non_pending  from non_pending))
) as reliability_percentage;





