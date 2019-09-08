require'./lib/library.rb'

describe Library do
    it 'should load data from Yaml file' do
    expect(subject.collection).not_to be nil
    end

    
    it 'should show a list of the books stored in the book list' do
    expected_output = {[:item][:title] + " " + [:author]}
    expect(subject.display_books).to eq expected_output
    end

    it 'should be able to find a title ' do
    expected_output = {:item=>{:title=>'Osynligt med Alfons', :author=>'Gunilla Bergström'}, :available=>true, :return_date=>nil}
    expect{subject.search_for_book_title('Osynligt')}.to eq expected_output 
    end

    it 'should be able to find an author ' do
        expected_output = {:item=>{:title=>'Osynligt med Alfons', :author=>'Gunilla Bergström'}, :available=>true, :return_date=>nil}
       expect(subject.search_for_book_author(Gunilla)).to eq expected_output 
    end
    
end
