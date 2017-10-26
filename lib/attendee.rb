class Attendee
  attr_reader :id, :registration_date, :first_name, :last_name, :email_address,
              :home_phone, :street, :city, :state, :zipcode
  
  def initialize(attributes)
    @id, @registration_date, @first_name, @last_name, @email_address,
    @zipcode, @city, @state, @street, @home_phone = attributes
  end

  def to_a
    [
      @id,
      @registration_date,
      @first_name,
      @last_name,
      @email_address,
      @home_phone,
      @street,
      @city,
      @state,
      @zipcode
    ]
  end
end