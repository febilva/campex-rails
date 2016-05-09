class Guardian < ActiveRecord::Base
  belongs_to :student
  belongs_to :qualification
  belongs_to :occupation
  belongs_to :country
  belongs_to :state
  belongs_to :district
end
