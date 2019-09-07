require './lib/library.rb'

describe Library do
  it 'needs to have access to a database of books' do
    expect(subject.data).not_to be nil
  end

  it 'needs to print a list of available books, both title and author name' do
    expected_output = "Gunilla Bergström : Alfons och soldatpappan\nGunilla Bergström : Osynligt med Alfons\nAstrid Lindgren : Pippi Långstrump\nAstrid Lindgren : Pippi Långstrump går ombord\n"
    expect{subject.see_available_books}.to output(expected_output).to_stdout
  end


  #needs to print out a list of books with titles and author names
end
