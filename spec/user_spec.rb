require './lib/account.rb'
require './lib/books.rb'
require './lib/user.rb'
require 'pry'

describe User do
    subject { described_class.new(id: '1234') }

    it 'gets an :id on initialize' do
        expect(subject.id).not_to be nil
    end
    
    it 'raises an error if no :id is set' do
         # Ex. expect{ described_class.new }.to raise_error 'A person name is required'
    end

    # describe 'user can create an account' do
    #     before # Ex. { subject.create_account }
        
    #     it 'will be of user class' do
    #         # Ex. expect(subject.account).to be_an_instance_of Account
    #     end

    #     it 'assigns user as owner' do
    #         # Ex. expect(subject.account.owner).to be subject
    #     end
    # end

    # describe 'user can checkout book if???' do
    #     let # Ex. let(:atm) { ATM.new }
    #     before # Ex. { subject.create_account }

    #     it 'user can return book???' do
    #         # Ex. expect(subject.deposit(100)).to be_truthy
    #     end
    # end


    # Other code example
    # it 'can withdraw funds' do 
    #     command = lambda { 
    #         subject.withdraw(                   
    #             amount: 100, 
    #             pin: subject.account.pin_code, 
    #             account: subject.account,
    #             atm: ATM
    #         )
    #     }
    #     expect(command.call).to be_truthy
    # end

    # it 'checked out books are displayed in user account' do
    #     # Ex. subject.cash = 100
    #     # subject.deposit(100)
    #     # expect(subject.account.balance).to be 100
    #     # expect(subject.cash).to be 0
    # end

    # it 'checkout is expected to raise an error if the book is unavailable' do ???
    #     # Ex. command = lambda {
    #     #     subject.withdraw(
    #     #         amount: 100,
    #     #         pin: subject.account.pin_code,
    #     #         account: subject.account
    #     #     )
    #     # }
    #     # expect { command.call }.to raise_error 'An ATM is required'
    # end

end