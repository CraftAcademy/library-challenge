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

    describe 'can checkout book when' do
        let(:item) { Books.new }
        before { subject.create_account }

        it 'the status of the book is changed to unavailable' do
            expected_output = false
            expect(subject.checkout.item[item][:available]).to eq expected_output
         end
      

        # it 'user can return book???' do
        #     expect(subject.return(item)).to be_truthy
        # end
    end


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