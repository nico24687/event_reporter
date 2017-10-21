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

  def count
    records.count
  end
end