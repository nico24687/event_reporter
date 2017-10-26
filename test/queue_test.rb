require './test/test_helper'
require './lib/queue'
require './lib/attendee'
require 'pry'

class QueueTest < MiniTest::Test
  def setup
    @attendees = [
      Attendee.new(["1", "reg date", "John", "Doe", "test@example.com", 20010, "Washington", "DC", "3155 19th St NW", "6154385000" ]),
      Attendee.new(["2", "reg date", "Jane", "Doe", "test2@example.com", 20011, "Saint Petersburg", "FL", "4175 3rd Street North", "5154385100"]),
      Attendee.new(["3", "reg date", "Jane", "Dough", "test3@example.com", 20013, "Washington", "DC", "3155 19th St NW", "4154385200"])
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
    expected = "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE\n" +
               "Doe\tJohn\ttest@example.com\t20010\tWashington\tDC\t3155 19th St NW\t6154385000\n" +
               "Doe\tJane\ttest2@example.com\t20011\tSaint Petersburg\tFL\t4175 3rd Street North\t5154385100\n" +
               "Dough\tJane\ttest3@example.com\t20013\tWashington\tDC\t3155 19th St NW\t4154385200"
    actual = @queue.print
  
    assert_equal(expected, actual)
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
