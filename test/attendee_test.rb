# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'
require 'pry'

class AttendeeTest < MiniTest::Test
  def test_can_initialize_from_csv_hash
    attributes = ["1", "11/12/08 10:47", "Allison", "Nguyen", "arannon@jumpstartlab.com", "6154385000", "3155 19th St NW", "Washington", "DC", "20010" ]
    attendee = Attendee.new(attributes)

    # TODO assert more attributes
    assert_equal "1", attendee.id
    assert_equal "Allison", attendee.first_name
    assert_equal "Nguyen", attendee.last_name
  end
end 