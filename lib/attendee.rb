class Attendee
  attr_reader :id, :registration_date, :first_name, :last_name, :email,
              :home_phone, :street, :city, :state, :zip_code
  
  def initialize(hash)
    @id = hash[" "]
    @registration_date = hash["RegDate"]
    @first_name = hash["first_Name"]
    @last_name = hash["last_Name"]
    @email_address = hash["email_address"]
    @home_phone = hash["HomePhone"]
    @street = hash["Street"]
    @city = hash["City"]
    @state = hash["State"]
    @hash = hash["Zipcode"]
  end
end