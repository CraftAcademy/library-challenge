# require './lib/account.rb'
# require 'date'
# require './lib/data.yml'
require './lib/books.rb'
require 'pry'
require 'pry-byebug'
require 'yaml'

describe Books do
    let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/20', account_status: :active) }
        before do
            allow(Books).to receive(YAML.load_file('./lib/data.yml'))
        end


    it 'has books on library shelves' do
    expect(subject.books).to != true
    end 

    it 'number of available books are reduced at checkout' do
    subject.checkout(1, '1234', account)
    expect(subject.books).to eq -1 #changes book availability 
    end

    it 'rejects checkout if the book is already checked out' do
    expected_output = { status: false, message: 'book checked out', date: Date.today }
    expect(subject.checkout(1, '1234', account)).to eq expected_output
    end

    it 'allows checkout if the book is available' do
    expected_output = { status: true, message: 'success', date: Date.today}
    expect(subject.checkout(1, '1234', account)).to eq expected_output
    end

    it 'reject checkout if the pin is wrong' do
    expected_output = { status: false, message: 'wrong pin', date: Date.today }
    expect(subject.checkout(1, 1234, account)).to eq expected_output
    end

    it 'reject checkout if library account is expired' do
    allow(account).to receive(:exp_date).and_return('02/30')
    expected_output = { status: false, message: 'library account expired', date: Date.today }
    expect(subject.checkout(1, '1234', account)).to eq expected_output
    end

end

#describe Atm do
  #  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/20', account_status: :active) }
   # before do
        # Before each test we need to add an attribute of `balance`
        # to the `account` object and set the value to `100`
    #    allow(account).to receive(:balance).and_return(100)
        # We also need to allow `account` to receive the new balance
        # using the setter method `balance=`
     #   allow(account).to receive(:balance=)
    #end

    #it 'has 1000$ on initialize' do
    #    expect(subject.funds).to eq 1000
    #end 

    #it 'funds are reduced at withdraw' do
    #    subject.withdraw(50, '1234', account)
    #    expect(subject.funds).to eq 950
    #end

   # it 'rejects withdraw if account has insufficient funds' do
      #  expected_output = { status: false, message: 'insufficient funds', date: Date.today }
     #   expect(subject.withdraw(105, '1234', account)).to eq expected_output
    #end

    #it 'allow withdraw if the account has enough balance.' do
     #   expected_output = { status: true, message: 'success', date: Date.today, amount: 45, bills: [20, 20, 5] }
     #   expect(subject.withdraw(45, '1234', account)).to eq expected_output
   # end

   ### We do not need the statement below:
    ###it 'reject withdraw if ATM has insufficient funds' do
     ###   subject.funds = 50
     ###   expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
     ###   expect(subject.withdraw(100, '1234', account)).to eq expected_output
    ###end

    #it 'reject withdraw if the pin is wrong' do
     #   expected_output = { status: false, message: 'wrong pin', date: Date.today }
     #   expect(subject.withdraw(50, 9999, account)).to eq expected_output
   # end

    #it 'reject withdraw if the card is expired' do
  #      allow(account).to receive(:exp_date).and_return('12/15')
   #     expected_output = { status: false, message: 'card expired', date: Date.today }
     #   expect(subject.withdraw(6, '1234', account)).to eq expected_output
    #end
### We do not need the statement below:
  #  it 'reject withdraw if account is disabled' do
  #      allow(account).to receive(:account_status).and_return(:disabled)
  #      expected_output = { status: false, message: 'account disabled', date: Date.today }
  #      expect(subject.withdraw(100, '1234', account)).to eq expected_output
  #  end
    
  ### We do not need the statement below:
  #  it 'allow withdraw if account has enough balance.' do
  #      expected_output = {
  #          status: true,
   #         message: 'success',
   #         date: Date.today,
   #         amount: 45,
          #  bills: [20, 20, 5]}
   #     expect(subject.withdraw(45, '1234', account)).to eq expected_output
   # end
#end