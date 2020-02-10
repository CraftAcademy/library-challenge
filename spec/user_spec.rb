require './lib/account.rb'
require './lib/books.rb'
require './lib/user.rb'
require 'pry'

describe User do
    subject { described_class.new(id: '1234') }

    it 'gets an :id on initialize' do
        expect(subject.id).not_to be nil
    end

    describe 'user can create an account' do
        before { subject.create_account }
        
        it 'will be of user class' do
            expect(subject.account).to be_an_instance_of Account
        end

        it 'assigns user as owner' do
            expect(subject.account.owner).to be subject
        end
    end

end