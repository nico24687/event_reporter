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
    header = "LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"
    report = ""
    @sorted_attendees = if attribute
      @attendees.sort_by { |attendee| attendee.send(attribute) }
    else
      @attendees
    end

    field_names = [:last_name, :first_name, :email_address, :zipcode, :city, :state, :street, :home_phone]

    body = @sorted_attendees.map do |attendee|
      field_names.map { |field| attendee.send(field) }.join("\t")
    end.join("\n")

    [header, body].join("\n")
  end

  def save(filename)
    CSV.open(filename, "w") do |csv|
      csv << ["id", "registration date", "first name", "last name",  "email", "phone number", "address", "city", "state", "zipcode"]
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