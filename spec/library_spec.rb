require './lib/library.rb'
require 'Date'

describe Library do

    it "shows list of book" do
    expect(subject.collection).not_to be_nil
    end

end