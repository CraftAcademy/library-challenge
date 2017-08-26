class Customer

  def what_is_your_name
    puts "What is your name? "
    @username = gets.chomp.to_s
  end
end
