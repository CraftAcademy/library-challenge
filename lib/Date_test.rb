require 'date' 
puts "What date was the book borrowed (MM/DD/YYYY)"
date = gets.chomp 
start_date = Date.strptime(date, "%D") 
puts "How many days was your Trip?[Ex.(1..100)]"
borrowing_period = 30
end_date = start_date.next_day(borrowing_period)  
puts "Your book was borrowed on #{start_date} and is due backon #{end_date}."
