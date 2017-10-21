require 'minitest/autorun'
require 'minitest/pride'
require './lib/reporter'
require 'pry'

class ReporterTest < MiniTest::Test
  def test_find_can_search_by_criteria
    reporter = Reporter.new
    reporter.load_csv("./test/test.csv")

    records = reporter.find(:id, "2")

    assert_equal 1, records.count
    assert_equal "Hankins", records.first.last_name
  end

  def test_find_is_case_insensitive
    reporter = Reporter.new
    reporter.load_csv("./test/test.csv")

    records = reporter.find(:first_name, "Sarah")

    assert_equal 2, records.count
    assert_equal "Hankins", records.first.last_name
    assert_equal "Xx", records.last.last_name
  end

  def test_find_is_insensitive_to_internal_whitespace
    reporter = Reporter.new
    reporter.load_csv("./test/test.csv")

    records = reporter.find(:first_name, "John")

    assert_equal ["4", "5"], records.map(&:id)
  end

  def test_find_does_not_substring_matches
    reporter = Reporter.new
    reporter.load_csv("./test/test.csv")

    records = reporter.find(:first_name, "Jean")

    assert_equal ["8"], records.map(&:id)
  end
end 