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
end