require './lib/user.rb'

describe User do
  it 'needs to print a list of available books, both title and author name' do
    expected_output = "Gunilla Bergström : Alfons och soldatpappan\nGunilla Bergström : Osynligt med Alfons\nAstrid Lindgren : Pippi Långstrump\nAstrid Lindgren : Pippi Långstrump går ombord\n"
    expect{subject.see_available_books}.to output(expected_output).to_stdout
  end
end