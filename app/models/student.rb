class Student < ActiveRecord::Base
  has_one :registration_form
end
