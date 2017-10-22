require 'csv'
require './lib/attendee'

class Reporter
  attr_reader :records

  def initialize
    @records = []
  end

  def load_csv(filename)
    CSV.foreach(filename, headers: false) do |row|
      @records << Attendee.new(row.to_a)
    end
  end

  def find(attribute, criteria)
    @records.select do |record|
      normalize_attribute(record.send(attribute)) == normalize_attribute(criteria)
    end
  end

  private

  def normalize_attribute(attribute)
    return unless attribute
    attribute.strip.downcase
  end
end