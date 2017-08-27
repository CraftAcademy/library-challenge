
class User_input

  def initialize
  end

  def input_search_author
    return gets.chomp.capitalize
  end

  def input_username
    return gets.chomp.capitalize
  end

  def input_borrow_menu
    return gets.chomp.to_i
  end

  def input_return_to_menu
    return gets.chomp
  end
end
