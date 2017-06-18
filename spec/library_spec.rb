require './lib/library.rb'
require 'spec_helper.rb'
require 'library'

describe Library do
  it "1 proper library" do
  library = Library.new
  library.title.should == "title"
  library.author.should == "author"
  library.available.should == "available"
  library.return_date.should == "return_date"
  library.item.should == "item"
  end

it "Should load data.yml" do
  expect.Library(config).to eq(answer1ß)

end

end
