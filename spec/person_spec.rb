require './lib/person.rb'

describe Person do

    it 'every customer has a user_id and a pin_code' do
        expect(subject.user_id).not_to be nil
        expect(subject.pin_code).not_to be nil
    end

end