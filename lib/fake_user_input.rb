class Fake_user_input

  attr_accessor :author, :username, :menu_choice, :menu_return, :menu_start_input

  def initialize
    @numbers_of_time_input_menu = 0
  end

  def input_search_author
    return author
  end

  def input_username
    return username
  end

  def input_borrow_menu
    return menu_choice
  end

  def input_return_to_menu
    return menu_return
  end

  def input_menu
    if @numbers_of_time_input_menu == 0
      @numbers_of_time_input_menu += 1
      return menu_start_input
    else
      return 6
    end
  end
end
