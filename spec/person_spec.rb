require './lib/person.rb'

describe Person do
  let(:person) {instance_double('Person',{:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>'2017-09-27', :renter=>'Olof'})}
  # before do
  #   books = YAML.load_file('./lib/books.yml')
  # end
  # after do
  #   collection = YAML.load_file('./lib/books.yml')
  #   collection.each { |obj| obj[:available] = true }
  #   File.open('./lib/books.yml', 'w') { |f| f.write collection.to_yaml }
  # end

  it 'can check the return date on books they have rented' do
    expected_output = :return_date
    expect(subject.search_my_books).to eq expected_output
  end
  it 'can check renter of books' do
    expected_output = @name
    expect(subject.set_renter).to eq expected_output
  end
end
