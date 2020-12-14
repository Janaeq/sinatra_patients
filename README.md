# Sinatra Patients

This is an application that uses Sinatra and ActiveRecord to allow a user to access a doctor's office's database.
The user can enroll as a new employee, log in and out of the application, and render/update information about both the patients and the doctors.
The user also has the ability to change their username and password if they choose to.
This application uses input validators to ensure that the proper information is being received, and it uses authorization helper methods to ensure that one user can't edit another users information.

# Getting Started

Fork and clone this repository. Then run
```bundle instal```