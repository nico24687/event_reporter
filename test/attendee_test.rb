require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'
require 'pry'

class AttendeeTest < MiniTest::Test
  def test_can_initialize_from_csv_hash
    hash = {" "=>"1", "RegDate"=>"11/12/08 10:47", "first_Name"=>"Allison", "last_Name"=>"Nguyen", "Email_Address"=>"arannon@jumpstartlab.com", "HomePhone"=>"6154385000", "Street"=>"3155 19th St NW", "City"=>"Washington", "State"=>"DC", "Zipcode"=>"20010"}
    attendee = Attendee.new(hash)

    # TODO assert more attributes
    assert_equal "1", attendee.id
    assert_equal "Allison", attendee.first_name
    assert_equal "Nguyen", attendee.last_name
  end
end 