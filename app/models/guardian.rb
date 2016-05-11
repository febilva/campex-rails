class Guardian < ActiveRecord::Base
  belongs_to :student
  belongs_to :qualification
  belongs_to :occupation
  belongs_to :country
  belongs_to :state
  belongs_to :district

  before_validation :check_if_same_address

  protected
    def check_if_same_address
      if self.same_address
        address_fields = ['address_line1', 'address_line2', 'country_id', 'state_id',
           'district_id', 'taluk', 'post_office', 'pincode']
        address_fields.each do |field|
          eval("self.#{field} = self.student.#{field}")
        end
      end
    end
end
