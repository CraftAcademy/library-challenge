## import files and built-in methods using <require('name')>
require 'date'
require './lib/member.rb'

describe Member do
    

    it 'Give member name' do
        member1 = described_class.new(name: 'Max') 
        expect(member1.name).to eq 'Max'
    end

end