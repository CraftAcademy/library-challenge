require 'yaml'
require './lib/library'

describe Library do

    it 'make a Library with books' do
        expect(subject).to be_an_instance_of Library
    end

end
