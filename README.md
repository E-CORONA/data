# E-Corona Project
project description to the project for DBMS3.
## Project goal and its applications, benefits in real world
Due to recent news, the consequences of which have affected not only our country but also the life cycle and economies of all countries in the world - the emergence of the highly dangerous Covid-19 virus - it has become very difficult to care for all patients at once. This is due not only to the fact that the number of medical personnel is insufficient to serve all patients over time but also to the fact that doctors have to work hard to serve and not get infected by the virus from a patient, as many still do not understand the seriousness of the disease. 
Our project proposes to solve this essentially the very serious problem with the help of online consultations with doctors, who will help those who are not seriously ill (i.e. asymptomatically, for example) or people who have already contracted the virus, maintain their health and make sure that they do not re-infected when the immunity of the infected person decreases. 

Website will enable people who are mildly ill, as well as those who have contracted the virus, to monitor their health online, without visiting doctors in hospitals, thus reducing the risk of falling ill again or infecting more healthy people who may be in their way. We have gathered the most experienced doctors, clinics, contacts, answers to frequently asked questions and want to make a unique platform for maintaining the health of our citizens into the Oracle database, also we have put together appropriate queries that will make it easier for visitors to the website to find the information they need quickly and conveniently.
Key Terms: the convenience of finding the right information in one place, avoiding unnecessary physical contact, the position of starting online medical consultations, and using the Oracle database.
## Scope of the project
Collect all necessary data, parse it, implement all functions and procedures to properly operate with data.
- Objectives: 
Collect of medical centers in all cities of Kazakhstan
Collect of infectious diseases doctors from each medical center
Collect places to take the PCR test
Processing frequently asked questions by searching among users
Create an opportunity for the user to make an appointment online for an infectious diseases doctor, take a PCR test
## Type of the user-interface
We have chosen a format of web application for our project. And to connect the interface with the database we are going to use PHP as a programming language. PHP uses the standard Oracle functions (ORA) and the interface to access Oracle functions (OCI), which makes it possible to use all the features of Oracle, including PL/SQL.

## Programming Language and database server
Methods: 
To start with, we used PHP to develop the backend side of the website.
A quick overview: PHP uses the standard Oracle functions (ORA) and the interface to access Oracle functions (OCI), which makes it possible to use all the features of Oracle, including PL/SQL.
Even though connecting PHP to Oracle did not seem so complicated, we were somewhat puzzled by the discrepancy between our database version and the XAMPP version of the database. 
At the end we opened our connect.php file and wrote the following command there:

```php
<?php
// Create connection to Oracle
$conn = oci_connect("ecoron", "qwerty123", "//localhost/orcl");
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {
   print "Connected to Oracle!";
}
// Close the Oracle connections
oci_close($conn);
?>
```
PHP - backend;
Front-end starter pack (HTML,CSS + Bootstrap 4);
Database server: XAMPP.
