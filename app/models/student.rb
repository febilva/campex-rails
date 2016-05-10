class Student < ActiveRecord::Base
  has_one :registration_form
  belongs_to :nationality, foreign_key: "nationality_id", class_name: "Country"
  has_one :guardian
  belongs_to :reservation_category
  belongs_to :caste
  belongs_to :state
  belongs_to :district
  belongs_to :comm_state, foreign_key: "comm_state_id", class_name: "State"
  belongs_to :comm_district, foreign_key: "comm_district_id", class_name: "District"
end
