require './lib/library.rb'

describe Library do
  it 'needs to have access to a database of books' do
    expect(subject.database).not_to be nil
  end

  it 'needs to print title and author name' do
    book = 'Gunilla Bergström : Skratta lagom! Sa pappa Åberg'

    command = lambda { "#{subject.database[1][:item][:author]} : #{subject.database[1][:item][:title]}" }
    expect(command.call).to eq book
  end


  #needs to print out a list of books with titles and author names
end
