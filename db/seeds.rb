#DOCTORS

pierce = Doctor.create(:name => "Maggie Pierce", :specialty => "Cardiology", :username => "mpierce", :password => "giftedandtalented26")

yang = Doctor.create(:name => "Christina Yang", :specialty => "Cardiology", :username => "cyang", :password => "MerismyPerson")

shepherd = Doctor.create(:name => "Derek Shepherd", :specialty => "Neurology", :username => "dshepherd", :password => "SavinLivesDaily")

montgomery = Doctor.create(:name => "Addison Montgomery", :specialty => "OB/GYN", :username => "amontgomery", :password => "Foreversingle")


#PATIENTS

jessica_day = Patient.create(:name => "Jessica Day", :insurance => "United Healthcare", :diagnosis => "PCOS", :medications => "Progesterone, Follitropin") # Montgomery

jesse_pinkman = Patient.create(:name => "Jesse Pinkman", :insurance => "Medicare", :diagnosis => "Epilepsy", :medications => "Gabapentin, Midazolam, Clonazepam, Carbamazepine") # shepherd

winston_bishop = Patient.create(:name => "Winston Bishop", :insurance => "Cigna", :diagnosis => "Coronary Artery Disease", :medications => "Atorvastatin, Aspirin, Amlodipine") # yang

walter_white_jr = Patient.create(:name => "Walter White Jr", :insurance => "Horizon", :diagnosis => "Cerebral Palsy", :medications => "Baclofen, Tizanidine") # Shepherd

blair_waldorf = Patient.create(:name => "Blair Waldorf", :insurance => "Wellcare", :diagnosis => "Gestation", :medications => "Folic Acid, Vitamin B, Zinc Supplement, Vitamin D") # montgomery

serena_vanderwoodsen = Patient.create(:name => "Serena Van Der Woodsen(", :insurance => "United Healthcare", :diagnosis => "Congestive Heart Failure", :medications => "Lisinopril, Losartan, Carvedilol, Bumex") # pierce