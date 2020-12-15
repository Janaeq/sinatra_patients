# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Require sinatra gem, inherit from sinatra base in ApplicationController, use 
- [x] Use ActiveRecord for storing information in a database - Require ActiveRecord, use ActiveRecord migrations, use ActiveRecord methods such as Doctor.patients (with belongs_to and has_many relations)
- [x] Include more than one model class (e.g. User, Post, Category) - User, Doctor, Patient
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - Doctor has many patients
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Patient belongs to a doctor
- [x] Include user accounts with unique login attribute (username or email) - users have a username that is validated for uniqueness
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - CRUD is used in patient and doctor controllers
- [x] Ensure that users can't modify content created by other users - Add authorized_user method to ApplicationController to make sure that no one can edit/delete a users information
- [x] Include user input validations - Validations in all models
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Flash Error messages displayed when inputs are invalid
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
