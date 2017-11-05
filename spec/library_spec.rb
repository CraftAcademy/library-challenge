require './lib/library.rb'

describe Library do
  it 'has collection of books on initialize' do
    expect(subject.books).to eq YAML.load_file('./lib/data.yml')
  end
    describe '#search' do
      it 'is expected to find book when searched by title only' do
        expected_output = [{:item=>
          {:title=>"The Hunger Games", :author=>"Suzanne Collins"},
          :available=>true, :return_date=>nil}]
        expect(subject.search(title: "The Hunger Games")).to eq expected_output
      end

      it 'is expected to find book when searched by author only' do
        expected_output = [{:item=>
          {:title=>"The Lord Of The Rings", :author=>"J.R.R Tolkien"},
          :available=>true, :return_date=>nil}]
        expect(subject.search(author: "J.R")).to eq expected_output
      end

      it 'is expected to find book when searched by title and author' do
        expected_output = [{:item=>
          {:title=>"The Hunger Games", :author=>"Suzanne Collins"},
          :available=>true, :return_date=>nil}]
          expect(subject.search(title: "The", author: "Suz")).to eq expected_output
      end

      it 'is expected to find book when searched by available' do
        expected_output = [{:item=>
          {:title=>"Diary of a Wimpy Kid", :author=>"Jeff Kinney"},
          :available=>true, :return_date=>nil},
 {:item=>
   {:title=>"Harry Potter and the Chamber of Secrets", :author=>"J.K. Rowling"},
   :available=>true, :return_date=>nil},
 {:item=>
   {:title=>"The Hunger Games", :author=>"Suzanne Collins"},
   :available=>true, :return_date=>nil},
 {:item=>{:title=>"The Lord Of The Rings", :author=>"J.R.R Tolkien"},
 :available=>true, :return_date=>nil},
 {:item=>
   {:title=>"Of Mice And Men", :author=>"John Steinbeck"},
   :available=>true, :return_date=>nil}]
        expect(subject.search(available: true)).to eq expected_output
      end
    end
end
