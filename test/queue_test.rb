require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'
require './lib/attendee'
require 'pry'

class QueueTest < MiniTest::Test
  def setup
    @attendees = [
      Attendee.new({ " " => "1", "first_Name" => "John", "last_Name" => "Doe" }),
      Attendee.new({ " " => "2", "first_Name" => "Jane", "last_Name" => "Doe" }),
      Attendee.new({ " " => "3", "first_Name" => "Jane", "last_Name" => "Dough" })
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
end