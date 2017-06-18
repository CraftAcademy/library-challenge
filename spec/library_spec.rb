require './lib/library.rb'
require 'spec_helper.rb'
require 'library'

describe Library do
  it "proper library" do
    library = Library.new
    library.title.should == "title"
  end

  it "have a author" do
    library = Library.new
    library.author.should == "author"
  end

end
