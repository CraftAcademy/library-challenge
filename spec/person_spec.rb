require "./lib/library.rb"

describe Person do

    it 'expected person to visit library' do
        expect(subject.person).to_not be nil 
    end

end
