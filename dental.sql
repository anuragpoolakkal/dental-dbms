-- CREATING TABLES --

create table patients (patientid int primary key, pname varchar(20), pnumber varchar(10), email varchar(20));

create table staff (staffid int primary key, sname varchar(20), role varchar(20), snumber varchar(10));

create table dentists (dentistid int primary key, dname varchar(15), dnumber varchar(10), staffid int, foreign key(staffid) references staff(staffid));

create table procedures (procedureid int primary key, procedurename varchar(20),cost int);

create table appointments (appointmentid int primary key, patientid int, dentistid int, procedureid int, foreign key (patientid) references patients(patientid), foreign key(dentistid) references dentists(dentistid), foreign key(procedureid) references procedures(procedureid));

create table payments (paymentid int primary key, patientid int, appointmentid int, paymentdate date, amount int, foreign key(patientid) references patients(patientid), foreign key(appointmentid) references appointments(appointmentid));

create table medicalhistory (medicalhistoryid int primary key, patientid int, procedureid int, datevisited date, foreign key(patientid) references patients(patientid), foreign key(procedureid) references procedures(procedureid));


-- INSERTING VALUES --

insert into patients values (1, "Anvin", 9837623434, "anvin@email.com"), (2, "Anurag", 9837634343, "anurag@email.com"), (3, "Jacob", 7777634343, "jacob@email.com"), (4, "John", 9833434347, "john@email.com"),(5, "Aqeel", 9834343377, "aqeel@email.com");

insert into staff values (1, "Mohammed", "Receptionalist", 6543434367), (2, "Maya", "Assistant", 4563434354), (3, "Mohan", "Hygienist", 6543434887), (4, "Joe", "Dentist", 8343434653), (5, "Jose", "Dentist", 8434343566);

insert into dentists values (1, "Joe", 8343434653, 4), (2, "Jose", 8434343566, 5);

insert into procedures values (1, "Teeth Cleaning", 100), (2, "Tooth Extraction", 200), (3, "Dental Filling", 300);

insert into appointments values (1, 1, 1, 1), (2, 2, 1, 1), (3, 3, 2, 2), (4, 4, 2, 2);

insert into payments values (1, 3, 2, '2023-09-04', 100), (2, 1, 3, '2023-09-05', 200), (3, 2, 1, '2023-09-06', 300);

insert into medicalhistory values (1, 1,1, '2023-09-04'), (2, 1, 2, '2023-09-03'), (3, 1, 3, '2023-09-05');' LINES TERMINATED BY '\n' FROM procedures;