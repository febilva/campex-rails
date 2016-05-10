class Student < ActiveRecord::Base
  has_one :registration_form
  belongs_to :nationality, foreign_key: "nationality_id", class_name: "Country"
  has_one :guardian
  belongs_to :reservation_category
  belongs_to :caste
end
