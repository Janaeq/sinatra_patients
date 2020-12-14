#DOCTORS

pierce = Doctor.create(:name => "Maggie Pierce", :specialty => "Cardiology", :clinic_days => "Monday, Friday", :clinic_location => "David H. Koch Center", :on_call_days => "Tuesday, Thursday", :user_id => nil)

yang = Doctor.create(:name => "Christina Yang", :specialty => "Cardiology", :clinic_days => "Wednesday, Thursday", :clinic_location => "Rockefeller Outpatient Pavillion", :on_call_days => "Sunday, Monday", :user_id => nil)

shepherd = Doctor.create(:name => "Derek Shepherd", :specialty => "Neurology", :clinic_days => "Tuesday, Wednesday", :clinic_location => "Sidney Kimmel Center", :on_call_days => "Wednesday, Friday, Saturday", :user_id => nil)

montgomery = Doctor.create(:name => "Addison Montgomery-Shepherd", :specialty => "OB/GYN", :clinic_days => "Wednesday, Thursday, Friday", :clinic_location => "Breast and Imaging Center", :on_call_days => "Sunday, Monday, Tuesday, Saturday", :user_id => nil)


#PATIENTS

jessica_day = Patient.create(:name => "Jessica Day", :address => "837 Traction Avenue", :insurance => "United Healthcare", :diagnosis => "PCOS", :medications => "Progesterone, Follitropin", :doctor_id => 4) # Montgomery

jesse_pinkman = Patient.create(:name => "Jesse Pinkman", :address => "9809 Margo Street", :insurance => "Medicare", :diagnosis => "Epilepsy", :medications => "Gabapentin, Midazolam, Clonazepam, Carbamazepine", :doctor_id => 3) # shepherd

winston_bishop = Patient.create(:name => "Winston Bishop", :address => "837 Traction Avenue", :insurance => "Cigna", :diagnosis => "Coronary Artery Disease", :medications => "Atorvastatin, Aspirin, Amlodipine", :doctor_id => 2) # yang

walter_white_jr = Patient.create(:name => "Walter White Jr", :address => "308 Negra Arroyo Lane", :insurance => "Horizon", :diagnosis => "Cerebral Palsy", :medications => "Baclofen, Tizanidine", :doctor_id => 3) # Shepherd

blair_waldorf = Patient.create(:name => "Blair Waldorf", :address => "1136 Fifth Avenue", :insurance => "Wellcare", :diagnosis => "Gestation", :medications => "Folic Acid, Vitamin B, Zinc Supplement, Vitamin D", :doctor_id => 4) # montgomery

serena_vanderwoodsen = Patient.create(:name => "Serena Van Der Woodsen", :address => "455 Madison Avenue", :insurance => "United Healthcare", :diagnosis => "Congestive Heart Failure", :medications => "Lisinopril, Losartan, Carvedilol, Bumex", :doctor_id => 1) # pierce

#USERS

user1 = User.create(:username => "user1", :password => "pw", :name => "Awesome User")