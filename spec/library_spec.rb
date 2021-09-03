require "yaml"
require YAML.load_file('./lib/data.yml')


desribe Library do
    
    subject { described_class.new({ }) }
    it 'It is expected that the library can search for a book by title' do
    expect(subject.search_for_title("The Expanse")).to eq :title=>"The Expanse", :author=>"James S.A.Corey", :available=>false, :return_date=>"2021-09-22" 
    
    end
end

