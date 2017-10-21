def sputs(string)
  print string
  STDOUT.flush
end

input = ""
puts "Welcome!"

while input != "quit" do
  sputs "$ "
  input = gets.chomp
  puts "You typed #{input}"
end