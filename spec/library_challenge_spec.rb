require './lib/library_challenge.rb'

describe Library do

    #let[:title] { instance_double("title") }

    it "has a list of books" do
    expect(subject.book_list).to eq YAML.load_file('./lib/data.yml')
    end

    # it "books are searchable by title" do
    # expect(subject.book_search).to eq book_search
    # end

end
