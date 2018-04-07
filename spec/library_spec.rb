require './lib/library.rb'
require 'yaml'
require 'date'

describe Library do
  before :each do
    @list = YAML.load_file('./lib/data.yml')
  end

  it 'displays books in library' do
    expect(subject.list).to eq @list
  end

  it 'searches for a book by title' do
    expect(subject.search_title('Alfons och soldatpappan')).to eq [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}}]
  end

  it 'searches for a book by author' do
    expect(subject.search_author('Astrid Lindgren')).to eq [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}},
      {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}}]
  end

end
