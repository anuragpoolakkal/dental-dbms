/* CREATING TABLES */

create table patients (patientid int primary key, name varchar(20), phonenumber varchar(10), email varchar(20));

create table appointments (appointmentid int primary key, patientid int, dentistid int, foreign key (patientid) references patients(patientid), foreign key(dentistid) references dentists(dentistid));

create table dentists (dentistid int primary key, name varchar(15), phonenumber int, staffid int, foreign key(staffid) references staff(staffid));

create table procedures (procedureid int primary key, procedurename varchar(20),cost decimal(10,2));

create table payments (paymentid int primary key, patientid int, appointmentid int, procedureid int, paymentdate date, amount decimal(10,2),foreign key(patientid) references patients(patientid), foreign key(appointmentid) references appointments(appointmentid), foreign key(procedureid) references procedures(procedureid));

create table medicalhistory (medicalhistoryid int primary key, patientid int, datevisited date, foreign key(patientid) references patients(patientid));

create table staff (staffid int primary key, name varchar(20), position varchar(20), phonenumber varchar(10));


/* INSERTING VALUES */

insert into patients values (1, "Anvin", 98376, "anvin@email.com"), (2, "Anurag", 98376, "anurag@email.com"), (3, "Jacob", 77776, "jacob@email.com"), (4, "John", 98347, "john@email.com"),(5, "Aqeel", 98377, "aqeel@email.com");
 
insert into appointments values (1, 1, 1), (2, 2, 1), (3, 3, 2), (4, 4, 2);

insert into dentists values (1, "Joe", 84653, 4), (2, "Jose", 84566, 5);

insert into procedures values (1, "Teeth Cleaning", 100), (2, "Tooth Extraction", 200), (3, "Dental Filling", 300);

insert into payments values (1, 3, 2, 1, '2023-09-04', 100), (2, 1, 3, 2, '2023-09-05', 200), (3, 2, 1, 3, '2023-09-06', 300);

insert into medicalhistory values (1, 1, '2023-09-04'), (2, 1, '2023-09-03'), (3, 1, '2023-09-05');

insert into staff values (1, "Mohammed", "Receptionalist", 65467), (2, "Maya", "Assistant", 45654);

