Create Database City_Hospital;
Use City_Hospital;
Create Table Patients (
PatientId INT Primary Key,
Patientname Varchar(100),
Age Int,
Gender Enum("m","f"),
AdmissionDate Date
);

Alter Table Patients 
Add DoctorAssigned Varchar(50);
Alter table patients
Modify Patientname varchar(50);
Rename Table Patients To Patients_Info;
truncate Patients_info;
Select * From Patients_INFO;
Drop Table Patients_Info;