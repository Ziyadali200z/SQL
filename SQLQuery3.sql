create database Hospital_Management_System

create table DOCTOR(doctor_id int  identity(1,1) primary key,doctor_name varchar(100) not null, doctor_age int)
insert into DOCTOR values('ali',30)
insert into DOCTOR values('ahmed',25)
insert into DOCTOR values('mohamed',40)
insert into DOCTOR values('kalied',35)
insert into DOCTOR values('aiad',45)
insert into DOCTOR values('hesan',50)
insert into DOCTOR values('basyne',55)
insert into DOCTOR values('yones',30)
insert into DOCTOR values('ziyad',35)
insert into DOCTOR values('ahmed',30)
insert into DOCTOR values('basem',60)
update DOCTOR set doctor_name='sadeo',doctor_age=20 where doctor_id=5
Delete from DOCTOR where doctor_name='ziyad'
select*from DOCTOR
select doctor_name  from DOCTOR where doctor_age>=25
select *from DOCTOR where doctor_name like'ahmed%'and doctor_age=30
select *from DOCTOR where doctor_age between 25 and 45
select doctor_name from DOCTOR where doctor_id in (1,2,6,5)

create table patient(patient_id int  identity(1,1) primary key,patient_name varchar(100) not null, patient_age int ,appointment_id int)
insert into patient(patient_name, patient_age ,appointment_id) values('ziyad',25,1)
insert into patient(patient_name, patient_age ,appointment_id) values('ali',20,3)
insert into patient(patient_name, patient_age ,appointment_id) values('ahmed',30,4)
insert into patient(patient_name, patient_age ,appointment_id) values('osma',15,5)
insert into patient(patient_name, patient_age ,appointment_id) values('yones',20,6)
insert into patient(patient_name, patient_age ,appointment_id) values('mohmed',25,7)
insert into patient(patient_name, patient_age ,appointment_id) values('zineb',30,8)
insert into patient(patient_name, patient_age ,appointment_id) values('saied',40,9)
insert into patient(patient_name, patient_age ,appointment_id) values('mhomod',35,10)
insert into patient(patient_name, patient_age ,appointment_id) values('basem',40,11)
update patient set patient_name='ziyad ali',patient_age=20 where patient_id=7
Delete from patient where patient_age=15
select *from patient
select patient_name from patient where patient_age <30 
select patient_name from patient where patient_id between 4 and 10
select * from patient where patient_name like ('%ah%')
select patient_name from patient where patient_name like('%a%')

create table appointment(appointment_id int  identity(1,1) primary key not null,visit_id int  ,doctor_id int)
insert into appointment values(1,1)
insert into appointment values(2,2)
insert into appointment values(3,3)
insert into appointment values(4,4)
insert into appointment values(5,5)
insert into appointment values(6,6)
insert into appointment values(7,7)
insert into appointment values(8,8)
insert into appointment values(9,9)
insert into appointment values(10,10)
insert into appointment values(11,11)
update appointment set visit_id=15,doctor_id=20 where doctor_id=5 and visit_id=5
Delete from appointment where visit_id=11
select * from appointment
select * from appointment where visit_id in(5)
select * from appointment where doctor_id not in(7)

create table visit(visit_id int  identity(1,1) primary key,treatment varchar(100)  not null ,diagnosis varchar(MAX),appointment_id int,doctor_id int,patient_id int)
insert into visit values('good','ongoing',1,1,1)
insert into visit values('bad','Off',2,2,2)
insert into visit values('good','ongoing',3,3,3)
insert into visit values('bad','Off',4,4,4)
insert into visit values('good','ongoing',5,5,5)
insert into visit values('bad','Off',6,6,6)
insert into visit values('good','ongoing',7,7,7)
insert into visit values('bad','Off',8,8,8)
insert into visit values('good','ongoing',9,9,9)
insert into visit values('bad','Off',10,10,10)
insert into visit values('bad','Off',11,11,11)
update visit set treatment='good',diagnosis='ongoing' where visit_id=2
Delete from visit where doctor_id=10
SELECT *from visit
select * from visit where visit_id not in(7)
select * from visit where diagnosis is not null  

create table records(record_id int  identity(1,1) primary key  not null ,visit_id int,patient_id int )
insert into records values(1,1)
insert into records values(2,2)
insert into records values(3,3)
insert into records values(4,4)
insert into records values(5,5)
insert into records values(6,6)
insert into records values(7,7)
insert into records values(8,8)
insert into records values(9,9)
insert into records values(10,10)
insert into records values(11,11)
Delete from records where patient_id=9
update records set visit_id=13, patient_id=15 where record_id=8
SELECT *from records
select*from records where visit_id between 2 and 8
select * from records where record_id  in(7)

create table payment(payment_id int  identity(1,1) primary key,payment_amount int not null, bill_id int)
insert into payment values(500,1)
insert into payment values(400,2)
insert into payment values(600,3)
insert into payment values(700,4)
insert into payment values(800,5)
insert into payment values(200,6)
insert into payment values(300,7)
insert into payment values(100,8)
insert into payment values(1000,9)
insert into payment values(4000,10)
insert into payment values(5000,11)
delete from payment
update payment set payment_amount=1300 where payment_id=8
SELECT *from payment
select * from payment where payment_amount>200 and payment_amount<800
select * from payment where payment_amount=200 and bill_id= 6


create table bill(bill_id int  identity(1,1) primary key,bill_status varchar(100) not null,doctor_id int,patient_id int)
insert into bill values('The payment was made',1,1)
insert into bill values('Not paid yet',2,2)
insert into bill values('The payment was made',3,3)
insert into bill values('Not paid yet',4,4)
insert into bill values('The payment was made',5,5)
insert into bill values('Not paid yet',6,6)
insert into bill values('The payment was made',7,7)
insert into bill values('Not paid yet',8,8)
insert into bill values('The payment was made',9,9)
insert into bill values('goNot paid yetod',10,10)
insert into bill values('The payment was made',11,11)
update bill set bill_status='The payment was made' where bill_id=26
delete from bill where doctor_id=5
SELECT *from bill
select * from bill where bill_status is not null
select * from bill where doctor_id=5 and patient_id=5



select bill_status,doctor_age,doctor_name,patient_name,patient_age,payment_amount from bill B join DOCTOR d on B.bill_id=d.doctor_id join patient P on D.doctor_id=P.patient_id JOIN payment PP on pp.payment_id=B.bill_id
SELECT treatment,diagnosis,doctor_name,doctor_age,patient_name,patient_age FROM  records R left join visit V on R.record_id=V.visit_id left join patient P on V.visit_id=P.patient_id join DOCTOR d on V.visit_id=d.doctor_id
select patient.patient_name , bill.bill_id  from  patient full join bill  on bill.bill_id=patient.patient_id 
select patient.patient_id, bill.bill_status   from patient  inner join bill   on patient.patient_id=bill_id    where bill_status ='Not paid yet'
select visit.treatment, patient.patient_name from visit  right join patient  on patient.patient_id=visit.patient_id  right join DOCTOR  on DOCTOR.doctor_id=patient.patient_id

SELECT COUNT(doctor_id) ,doctor_name FROM DOCTOR GROUP BY doctor_name
SELECT COUNT(patient_id), patient_name FROM patient GROUP BY patient_name order BY COUNT(patient_id) DESC

SELECT patient_name FROM patient  WHERE patient_id IN (SELECT patient_id FROM patient WHERE patient_id >5)
SELECT doctor_age, doctor_name, OrderCount = (SELECT COUNT(patient_id) FROM [patient]  WHERE patient.patient_id=  DOCTOR.doctor_id)FROM DOCTOR  
SELECT treatment FROM visit WHERE patient_id IN (SELECT visit_id FROM visit WHERE treatment = 'bad')


