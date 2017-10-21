require 'csv'
require './lib/attendee'

class Reporter
  attr_reader :records

  def initialize
    @records = []
  end

  def load_csv(filename)
    CSV.foreach(filename, headers: true) do |row|
      @records << Attendee.new(row.to_hash)
    end
  end

  def find(attribute, criteria)
    @records.select do |record|
       record.send(attribute).strip.downcase == criteria.strip.downcase
    end
  end
end