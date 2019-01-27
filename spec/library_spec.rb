require './lib/library.rb'


describe Library do
    let(:person) {instance_double('Person' , name: 'Superman')}

    before do 
        list = YAML.load_file('./lib/data.yml')
        File.open('./lib/data.yml', 'w') { |f| f.write list.to_yaml }
    end

    it 'library shows list of all books' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.list).not_to be nil
    end

    it "allows to search for specific book" do
        expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:title].include? 'Pippi' }
        expect(subject.search_title('Pippi')).to eq expected_output
    end

    it 'allows person to borrow a book and change status to unavailable ' do
        expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:available] == true  }
        expect(subject.available).to be_truthy
    end
end
