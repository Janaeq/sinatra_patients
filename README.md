# Sinatra Patients

This is an application that uses Sinatra and ActiveRecord to allow a user to access a doctor's office's database.
The user can enroll as a new employee, log in and out of the application, and render/update information about both the patients and the doctors.
The user also has the ability to change their username and password if they choose to.
This application uses input validators to ensure that the proper information is being received, and it uses authorization helper methods to ensure that one user can't edit another users information.

# Getting Started

Fork and clone this repository. Then run
```bundle install```.

Once all the gems in the gemfile are installed, you can begin the server by running ```shotgun``` and entering the Shotgun port in your browser.
(This should be '127.0.0.1:9393' or, more commonly, 'localhost:9393')

You can either enroll with the seeded user or create a new user by clicking on "Enroll a New User" on the bottom left.


