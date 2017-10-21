require 'csv'
require 'erb'

class Queue
  def initialize(attendees)
    @attendees = attendees
  end

  def count
    @attendees.count
  end

  def clear
    @attendees = []
  end

  def print(attribute = nil)
    puts "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"

    @sorted_attendees = if attribute
      @attendees.sort_by { |attendee| attendee.send(attribute) }
    else
      @attendees
    end

    # opportunity to refactor
    @sorted_attendees.each do |attendee|
      puts attendee.to_a.join("\t")
    end
  end

  def save(filename)
    CSV.open(filename, "w") do |csv|
      csv << ["last name", "first name", "email", "zipcode", "city", "state", "address", "phone number"]
      @attendees.each do |attendee|
        csv << attendee.to_a 
      end
    end

    puts "Saved csv to #{filename}"
  end

  def export_html(filename)
    template = ERB.new(File.read("./report.html.erb"))
    html = template.result(binding)
    File.write(filename, html)

    puts "Exported file to #{filename}"
  end
end