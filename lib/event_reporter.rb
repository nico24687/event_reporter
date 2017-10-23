require './lib/reporter.rb'
require './lib/queue.rb'
require 'pry'

class EventReporter
  def initialize
    @reporter = Reporter.new
    @input = ""
    @queue = Queue.new([])
  end

  def start
    puts "Welcome!"
    
    while @input != "quit" do
      sputs "$ "
      @input = gets.chomp
    
      process_command(@input)
    end
  end

  def sputs(string)
    print string
    STDOUT.flush
  end

  def process_command(input)
    command, *args = input.split

    case command
    when "load"
      @reporter.load_csv(args.first || "full_event_attendees.csv")
    when "find"
      @queue = Queue.new(@reporter.find(args[0], args[1..-1].join(" ")))
    when "queue"
      case args.first
      when "print"
        order_attribute = if args[1] == "by"
          args[2]
        else
          args[1]
        end

        @queue.print(order_attribute)
      when "clear"
        @queue.clear
      when "save"
        @queue.save(args[2])
      when "export"
        @queue.export_html(args[2])
      when "count"
        puts @queue.count
      end 
      
      
    when "help"
      print_help(args.join(" "))
    end
  end

  def print_help(input)
    if input.empty?
      puts "Available commands: load <filename>, find <attribute>
       <criteria>, queue count, queue clear, queue print, 
       queue print by <attribute>, queue save to <filename.csv>,
       queue export html <filename.csv>, help <command>"
      return
    end

    case input
    when "load <filename>"
      puts "Loads the csv file provided, if no file name given defaults to full_event_attendess.csv"
    when "find <attribute> <criteria>"
      puts "Populates the queue with records matching the given attribute and criteria"
    when "queue count"
      puts "Lists the amount of records in the current queue"
    when "queue clear"
      puts "Empties the current queue"
    when "queue print"
      puts "Prints out a tab delimited table in a specific format"
    when "queue print by <attribute>"
      puts "Prints a table sorted by the specific attribute"
    when "queue save to <filename.csv>"
      puts "Exports the current queue to the specified filename as a CSV"
    when "queue export html <filename.csv>"
      puts "Exports the current queue to the specified filename as HTML"
    when "help <command>"
      puts "Provides a description of what each command will do"
    end  
  end
end

EventReporter.new.start
