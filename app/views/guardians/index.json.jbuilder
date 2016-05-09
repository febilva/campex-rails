json.array!(@guardians) do |guardian|
  json.extract! guardian, :id, :student_id, :name, :gender, :email, :mobile_no, :phone_no, :relationship, :qualification_id, :occupation_id, :annual_income, :address_line1, :address_line2, :country_id, :state_id, :district_id, :taluk, :post_office, :pincode
  json.url guardian_url(guardian, format: :json)
end
