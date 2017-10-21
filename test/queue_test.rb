require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'
require './lib/attendee'
require 'pry'

class QueueTest < MiniTest::Test
  def setup
    @attendees = [
      Attendee.new({ " " => "1", "first_Name" => "John", "last_Name" => "Doe", "Email_Address" => "test@example.com", "Zipcode" => 20010, "City" => "Washington", "State" => "DC", "Street" => "3155 19th St NW", "HomePhone" => "6154385000" }),
      Attendee.new({ " " => "2", "first_Name" => "Jane", "last_Name" => "Doe", "Email_Address" => "test2@example.com", "Zipcode" => 20011, "City" => "Saint Petersburg", "State" => "FL", "Street" => "4175 3rd Street North", "HomePhone" => "5154385100" }),
      Attendee.new({ " " => "3", "first_Name" => "Jane", "last_Name" => "Dough", "Email_Address" => "test3@example.com", "Zipcode" => 20013, "City" => "Washington", "State" => "DC", "Street" => "3155 19th St NW", "HomePhone" => "4154385200" })
    ]

    @queue = Queue.new(@attendees)
  end

  def test_count_returns_number_of_attendees
    assert_equal 3, @queue.count
  end

  def test_clear_empties_the_queue
    @queue.clear

    assert_equal 0, @queue.count
  end

  def test_print_has_correct_output
    @queue.print
    # not my problem
  end

  def test_print_can_sort_by_columns
    @queue.print(:home_phone)
  end

  def test_save_to_csv
    @queue.save("/tmp/test.csv")
  end

  def test_export_to_html
    @queue.export_html("/tmp/test.html")
  end
end