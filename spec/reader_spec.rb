require './lib/reader.rb'
require 'pry'

describe Reader do

    subject {described_class.new(name: "Fat Bob")}

    it 'is expected to have a :name upon initialize' do
        expect(subject.name).not_to be nil
    end

end