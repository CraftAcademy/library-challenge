require './lib/user.rb'

describe User do
    it 'creates a user with no checked-out books' do
        expect(subject.books).to be_empty
    end
end