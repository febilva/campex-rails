class Student < ActiveRecord::Base
  has_one :registration_form
  has_one :nationality, foreign_key: "nationality_id", class_name: "Country"
  has_one :guardian
end
