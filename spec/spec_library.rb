require './lib/library.rb'



describe Library do 
    let(:visitor) {instance_double('Visitor', name: 'Thomas')}
    
    it 'it has books on initialize' do
        expect(subject.books).to eq YAML.load_file('./lib/data_test.yml')
    end

    it 'it shows results of search' do
        expected_output = [{:available=>true, :book=>{:author=>"Astrid Lindgren", :title=>"Pippi Långstrump"}, :return_date=>nil}]
        expect(subject.book_search("Pippi Långstrump")).to eq expected_output
    end

    it 'book is checked out and return date and availibilty updated' do
        expected_output = [{:available=>false, :return_date=>Date.today.next_day(30).strftime('%d/%m')}]
        expect(subject.checkout("Pippi Långstrump")).to_yaml(opts = {})
    end

end

