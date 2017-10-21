require './lib/reporter.rb'
require 'pry'

class EventReporter
  def initialize
    @reporter = Reporter.new
    @input = ""
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
      @reporter.load_csv(args.first)
      puts "Loaded #{@reporter.count} records from #{args.first}."
    end
  end
end

EventReporter.new.start
