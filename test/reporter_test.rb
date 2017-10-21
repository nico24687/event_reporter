require 'minitest/autorun'
require 'minitest/pride'
require './lib/reporter'
require 'pry'

class ReporterTest < MiniTest::Test
  def test_can_load_csv_file
    reporter = Reporter.new
    reporter.load_csv("./test/test.csv")

    assert_equal 3, reporter.count
    assert_equal ["Allison", "SArah", "Sarah"],
                 reporter.records.map(&:first_name)
  end
end 