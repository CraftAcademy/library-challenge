require './lib/library.rb'
require 'pry'
require 'date'
require './lib/fake_user_input.rb'

describe Library do
  it 'should have a collection of books' do
    expect(subject.collection).to be_an_instance_of(Array)
  end

  it 'should make a list of books that are available/unavailable' do
    subject.collection[0][:available] = false
    expect(subject.list_books).to be_truthy
  end

  it 'should be able to change_status of a book to unavailable' do
    index = 0
    subject.collection[0][:available] = true
    subject.change_status(index)
    expect(subject.collection[index][:available]).to eq false
  end

  it 'should set return_date for borrowed books' do
    index = 0
    expected_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.return_date(index)
    expect(subject.collection[index][:return_date]).to eq expected_date
  end

  it 'should show_books_menu that are available when borrowing' do
    expect{subject.show_books_menu}.to output("Which book do you want to borrow? Enter the corresponding number.\n1. AVAILABLE: The Winds of Winter by G.R.R. Martin (Fantasy)\n2. AVAILABLE: The Thorn of Emberlain by Scott Lynch (Fantasy)\n3. AVAILABLE: Doors of Stone by Patrick Rothfuss (Fantasy)\n4. AVAILABLE: Oathbringer by Brandon Sanderson (Fantasy)\n5. AVAILABLE: Tower of Dawn by Sarah J. Maas (Fantasy)\n6. AVAILABLE: The Bastards and the Knives by Scott Lynch (Fantasy)\n7. AVAILABLE: Provenance by Ann Leckie (Science Fiction)\n8. AVAILABLE: The Girl in the Tower by Katherine Arden (Fantasy)\n9. AVAILABLE: The Night Masquerade by Nnedi Okorafor (Science Fiction)\n10. AVAILABLE: Tortall - a Spy's Guide by Tamora Pierce (Fantasy)\n11. AVAILABLE: Sorcerer Royal by Zen Cho (Fantasy)\n12. AVAILABLE: Grey Sister by Mark Lawrence (Fantasy)\n13. AVAILABLE: Poor Relations by Jo Walton (Science Fiction)\n").to_stdout
  end

  it 'should show_books_menu that are unavailable when borrowing' do
    subject.collection[0][:available] = false
    expected_date = Date.today.next_month.strftime("%d/%m/%y")
    expect{subject.show_books_menu}.to output("Which book do you want to borrow? Enter the corresponding number.\n1. NOT AVAILABLE UNTIL : The Winds of Winter by G.R.R. Martin (Fantasy)\n2. AVAILABLE: The Thorn of Emberlain by Scott Lynch (Fantasy)\n3. AVAILABLE: Doors of Stone by Patrick Rothfuss (Fantasy)\n4. AVAILABLE: Oathbringer by Brandon Sanderson (Fantasy)\n5. AVAILABLE: Tower of Dawn by Sarah J. Maas (Fantasy)\n6. AVAILABLE: The Bastards and the Knives by Scott Lynch (Fantasy)\n7. AVAILABLE: Provenance by Ann Leckie (Science Fiction)\n8. AVAILABLE: The Girl in the Tower by Katherine Arden (Fantasy)\n9. AVAILABLE: The Night Masquerade by Nnedi Okorafor (Science Fiction)\n10. AVAILABLE: Tortall - a Spy's Guide by Tamora Pierce (Fantasy)\n11. AVAILABLE: Sorcerer Royal by Zen Cho (Fantasy)\n12. AVAILABLE: Grey Sister by Mark Lawrence (Fantasy)\n13. AVAILABLE: Poor Relations by Jo Walton (Science Fiction)\n").to_stdout
  end

  it 'should be able to send borrow_book to available' do
    index = 0
    subject.collection[index][:available] == true
    return_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.create_user('Amanda')
    expect{subject.borrow_book(index)}.to output("You borrowed: The Winds of Winter by G.R.R. Martin. Return by: #{return_date}!\n").to_stdout
  end

  it 'should be able to send borrow_book to unavailable' do
    index = 0
    return_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.collection[index][:available] = false
    subject.collection[index][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
    expect{subject.borrow_book(index)}.to output("The Winds of Winter is unavailable. It will be returned by #{return_date}.\n").to_stdout
  end

  it 'should borrow book if available' do
    index = 0
    return_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.create_user('Amanda')
    expect{subject.book_is_available(index)}.to output("You borrowed: The Winds of Winter by G.R.R. Martin. Return by: #{return_date}!\n").to_stdout
  end

  it 'should tell you if book you want to borrow is unavailable' do
    index = 0
    return_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.collection[index][:available] = false
    subject.collection[index][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
    expect{subject.book_is_unavailable(index)}.to output("The Winds of Winter is unavailable. It will be returned by #{return_date}.\n").to_stdout
  end

  it 'should be able to create_user' do
    expect{subject.create_user('Amanda')}.to output("Welcome Amanda.\n").to_stdout
  end

  it 'should show users borrowed books if there is an user with books' do
    subject.create_user('Amanda')
    subject.current_user.books = ['hey, it\'s a book!']
    expect{subject.show_borrowed_books}.to output("hey, it\'s a book!\n").to_stdout
  end

  it 'should show error message if no user wants to show books' do
    expect{subject.show_borrowed_books}.to output("Create an user or log in first!\n").to_stdout
  end

  it 'should show error message if user who has no books wants to show books' do
    subject.create_user('Amanda')
    expect{subject.show_borrowed_books}.to output("No books borrowed from here yet.\n").to_stdout
  end

  it 'should exit menu' do
    expect{subject.exit_program}.to output("Come back soon, there\'s lots to read here!\n").to_stdout
  end

  it 'should show error message no user when run' do
    expect{subject.error_message_no_user}.to output("Create an user or log in first!\n").to_stdout
  end

  it 'should show error message if not correct menu number' do
    expect{subject.error_message_menu}.to output("Choose correct menu number, please.\n").to_stdout
  end

  it 'should show error message if searching for non existing author' do
    expect{subject.error_message_no_match}.to output("No matching author.\n").to_stdout
  end

  it 'should print out a starting menu welcome' do
    expect{subject.menu_options}.to output("--- Welcome to the Library of Coming Books. Choose an option. ---\n    1. to create an user or log in\n    2. to list which books are available/unavailable\n    3. to searching for an author\n    4. to borrow an available book\n    5. to show your borrowed books\n    6. to exit\n").to_stdout
  end

  it 'should be able search for an author - has match' do
    author = 'Martin'
    expect{subject.search_author(author)}.to output("The Winds of Winter by G.R.R. Martin (Fantasy)\n").to_stdout
  end

  it 'should be able search for an author - has no match' do
    author = 'q'
    expect{subject.search_author(author)}.to output("No matching author.\n").to_stdout
  end

  it 'should get user input on search author' do
    input_fake = Fake_user_input.new
    input_fake.author = "Martin"
    subject.set_input_for_test(input_fake)
    expect{subject.search_author_input}.to output("Which author do you want to search for? Please enter first OR last name.\nThe Winds of Winter by G.R.R. Martin (Fantasy)\n").to_stdout
  end

  it 'should get user input for username' do
    input_fake = Fake_user_input.new
    input_fake.username = "username"
    subject.set_input_for_test(input_fake)
    expect{subject.user_name_input}.to output("Welcome to the library. Who are you?\nWelcome username.\n").to_stdout
  end

  it 'should get user input for borrow menu' do
    expected_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.create_user('Fake Amanda')
    input_fake = Fake_user_input.new
    input_fake.menu_choice = 1
    subject.set_input_for_test(input_fake)
    expect{subject.borrow_menu}.to output("Which book do you want to borrow? Enter the corresponding number.\n1. AVAILABLE: The Winds of Winter by G.R.R. Martin (Fantasy)\n2. AVAILABLE: The Thorn of Emberlain by Scott Lynch (Fantasy)\n3. AVAILABLE: Doors of Stone by Patrick Rothfuss (Fantasy)\n4. AVAILABLE: Oathbringer by Brandon Sanderson (Fantasy)\n5. AVAILABLE: Tower of Dawn by Sarah J. Maas (Fantasy)\n6. AVAILABLE: The Bastards and the Knives by Scott Lynch (Fantasy)\n7. AVAILABLE: Provenance by Ann Leckie (Science Fiction)\n8. AVAILABLE: The Girl in the Tower by Katherine Arden (Fantasy)\n9. AVAILABLE: The Night Masquerade by Nnedi Okorafor (Science Fiction)\n10. AVAILABLE: Tortall - a Spy's Guide by Tamora Pierce (Fantasy)\n11. AVAILABLE: Sorcerer Royal by Zen Cho (Fantasy)\n12. AVAILABLE: Grey Sister by Mark Lawrence (Fantasy)\n13. AVAILABLE: Poor Relations by Jo Walton (Science Fiction)\nYou borrowed: The Winds of Winter by G.R.R. Martin. Return by: 27/09/17!\n").to_stdout
  end

  it 'should get error message if no created user tries to use borrow_menu' do
    input_fake = Fake_user_input.new
    input_fake.menu_choice = 1
    subject.set_input_for_test(input_fake)
    expect{subject.borrow_menu}.to output("Create an user or log in first!\n").to_stdout
  end

  it 'should get error message if wrong menu choice in borrow_menu' do
    input_fake = Fake_user_input.new
    subject.create_user('Fake Amanda')
    input_fake.menu_choice = 112
    subject.set_input_for_test(input_fake)
    expect{subject.borrow_menu}.to output("Which book do you want to borrow? Enter the corresponding number.\n1. AVAILABLE: The Winds of Winter by G.R.R. Martin (Fantasy)\n2. AVAILABLE: The Thorn of Emberlain by Scott Lynch (Fantasy)\n3. AVAILABLE: Doors of Stone by Patrick Rothfuss (Fantasy)\n4. AVAILABLE: Oathbringer by Brandon Sanderson (Fantasy)\n5. AVAILABLE: Tower of Dawn by Sarah J. Maas (Fantasy)\n6. AVAILABLE: The Bastards and the Knives by Scott Lynch (Fantasy)\n7. AVAILABLE: Provenance by Ann Leckie (Science Fiction)\n8. AVAILABLE: The Girl in the Tower by Katherine Arden (Fantasy)\n9. AVAILABLE: The Night Masquerade by Nnedi Okorafor (Science Fiction)\n10. AVAILABLE: Tortall - a Spy's Guide by Tamora Pierce (Fantasy)\n11. AVAILABLE: Sorcerer Royal by Zen Cho (Fantasy)\n12. AVAILABLE: Grey Sister by Mark Lawrence (Fantasy)\n13. AVAILABLE: Poor Relations by Jo Walton (Science Fiction)\nChoose correct menu number, please.\n").to_stdout
  end

  it 'should take user input for return_to_menu' do
    input_fake = Fake_user_input.new
    input_fake.menu_return = 1
    subject.set_input_for_test(input_fake)
    expect{subject.return_to_menu}.to output("press ENTER to return to menu.\n").to_stdout
  end

  it 'should take an input in start menu' do
    input_fake = Fake_user_input.new
    input_fake.menu_start_input = 6
    subject.set_input_for_test(input_fake)
    expect{subject.menu}.to output("--- Welcome to the Library of Coming Books. Choose an option. ---\n    1. to create an user or log in\n    2. to list which books are available/unavailable\n    3. to searching for an author\n    4. to borrow an available book\n    5. to show your borrowed books\n    6. to exit\nCome back soon, there's lots to read here!\n").to_stdout
  end

  it 'should return to menu if exit = false' do
    input_fake = Fake_user_input.new
    input_fake.menu_start_input = 1
    subject.set_input_for_test(input_fake)
    expect{subject.menu}.to output("--- Welcome to the Library of Coming Books. Choose an option. ---\n    1. to create an user or log in\n    2. to list which books are available/unavailable\n    3. to searching for an author\n    4. to borrow an available book\n    5. to show your borrowed books\n    6. to exit\nWelcome to the library. Who are you?\nWelcome .\npress ENTER to return to menu.\n--- Welcome to the Library of Coming Books. Choose an option. ---\n    1. to create an user or log in\n    2. to list which books are available/unavailable\n    3. to searching for an author\n    4. to borrow an available book\n    5. to show your borrowed books\n    6. to exit\nCome back soon, there's lots to read here!\n").to_stdout
  end


  it 'should run through menu option 1' do
    input_fake = Fake_user_input.new
    input_fake.username = "username"
    subject.set_input_for_test(input_fake)
    expect{subject.menu_choices(1)}.to output("Welcome to the library. Who are you?\nWelcome username.\n").to_stdout
  end

  it 'should run through menu option 2' do
    expect{subject.menu_choices(2)}.to output("AVAILABLE: The Winds of Winter by G.R.R. Martin (Fantasy)\nAVAILABLE: The Thorn of Emberlain by Scott Lynch (Fantasy)\nAVAILABLE: Doors of Stone by Patrick Rothfuss (Fantasy)\nAVAILABLE: Oathbringer by Brandon Sanderson (Fantasy)\nAVAILABLE: Tower of Dawn by Sarah J. Maas (Fantasy)\nAVAILABLE: The Bastards and the Knives by Scott Lynch (Fantasy)\nAVAILABLE: Provenance by Ann Leckie (Science Fiction)\nAVAILABLE: The Girl in the Tower by Katherine Arden (Fantasy)\nAVAILABLE: The Night Masquerade by Nnedi Okorafor (Science Fiction)\nAVAILABLE: Tortall - a Spy's Guide by Tamora Pierce (Fantasy)\nAVAILABLE: Sorcerer Royal by Zen Cho (Fantasy)\nAVAILABLE: Grey Sister by Mark Lawrence (Fantasy)\nAVAILABLE: Poor Relations by Jo Walton (Science Fiction)\n").to_stdout
  end

  it 'should run through menu option 3' do
    expect{subject.menu_choices(3)}.to output("Which author do you want to search for? Please enter first OR last name.\nNo matching author.\n").to_stdout
  end

  it 'should run through meny option 4' do
    expect{subject.menu_choices(4)}.to output("Create an user or log in first!\n").to_stdout
  end

  it 'should run through meny option 5' do
    expect{subject.menu_choices(5)}.to output("Create an user or log in first!\n").to_stdout
  end

  it 'should run through meny option 6' do
    expect{subject.menu_choices(6)}.to output("Come back soon, there's lots to read here!\n").to_stdout
  end

  it 'should go to error message if wrong menu option' do
    expect{subject.menu_choices(15)}.to output("Choose correct menu number, please.\n").to_stdout
  end

  after do
    collection = YAML.load_file('./lib/book_data.yml')
    collection.each { |obj| obj[:available] = true }
    collection.each { |obj| obj[:return_date] = nil }
    File.open('./lib/book_data.yml', 'w') { |f| f.write collection.to_yaml }
  end
end
