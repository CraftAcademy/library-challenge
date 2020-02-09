require './lib/account.rb'
require './lib/books.rb'
require 'pry'

describe User do

    let(:user) { instance_double('User', id: '8510316584')}
    subject {   described_class.new({owner: id})    }

    it 'has an :id on initialize' do
        # Ex. expect(subject.id).not_to be nil
    end
    
    it 'rases an error if no :id is set' do
         # Ex. expect{ described_class.new }.to raise_error 'A person name is required'
    end
   
    it 'checks the amount of borrowed books on initialize' do
        # Ex. expect(subject.account).to be nil
    end

    it 'has a :account attribute' do
        # Ex. expect(subject.account).to be nil
    end

    describe 'user can create an account' do
        before # Ex. { subject.create_account }
        
        it 'will be of account class' do
            # Ex. expect(subject.account).to be_an_instance_of Account
        end

        it 'assigns user as owner' do
            # Ex. expect(subject.account.owner).to be subject
        end
    end

    describe 'user can checkout book if account has been created' do
        let # Ex. let(:atm) { ATM.new }
        before # Ex. { subject.create_account }

        it 'can return books' do
            # Ex. expect(subject.deposit(100)).to be_truthy
        end
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

    it 'books are added to the account balance - set as inactive from Books class' do
        # Ex. subject.cash = 100
        # subject.deposit(100)
        # expect(subject.account.balance).to be 100
        # expect(subject.cash).to be 0
    end

    it 'checkout is expected to raise an error if the book is unavailable' do
        # Ex. command = lambda {
        #     subject.withdraw(
        #         amount: 100,
        #         pin: subject.account.pin_code,
        #         account: subject.account
        #     )
        # }
        # expect { command.call }.to raise_error 'An ATM is required'
    end

    it 'book is returned to library and deducted from account balance' do
        # Ex. subject.cash = 100
            # subject.deposit(100)
            # subject.withdraw(
            #     amount: 100,
            #     pin: subject.account.pin_code,
            #     account: subject.account,
            #     atm: atm
            # )
            # expect(subject.account.balance).to be 0
            # expect(subject.cash).to be 100
    end

    describe 'can not borrow books if account has been deactivated' do
        it 'can not checkout books ' do
            # Ex. expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
        end
    end

end