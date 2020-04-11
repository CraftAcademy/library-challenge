require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do
#   let(:account) { instance_double('Account', card:, collection: ) } 

    it 'has collection on initialize' do
      expect(subject.collection_present).to eq true   
    end
    it 'searches for a book title in collection' do
      subject.search(title: 'Pippi Långstrump') 
      expect(subject.search).to eq 'Pippi Långstrump'
    end

 end   
    # it 'allows withdrawal if the account has enough balance.' do
    #   expected_output = { 
    #     status: true,
    #     message: 'success',
    #     date: Date.today, 
    #     amount: 45,
    #     bills: [20, 20, 5]}
    #   expect(subject.withdraw(45, '1234', account, :exp_date, :account_status)).to eq expected_output
    # end

    # it 'rejects withdrawal if account has insufficient funds' do
    #   expected_output = { status: false, message: 'insufficient funds in account', date: Date.today }
    #   expect(subject.withdraw(1005, '1234', account, :exp_date, :account_status)).to eq expected_output
    # end
    # it 'rejects withdrawal if ATM has insufficient funds' do
    #   subject.funds = 50
    #   expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    #   expect(subject.withdraw(100, '1234', account, :exp_date, :account_status)).to eq expected_output
    # end
    # it 'rejects withdrawal if the pin is wrong' do
    #   expected_output = { status: false, message: 'wrong pin', date: Date.today}
    #   expect(subject.withdraw(50, 9999, account, :exp_date, :account_status)).to eq expected_output
    # end
    # it 'rejects withdrawal if the card is expired' do
    #   allow(account).to receive(:exp_date).and_return('12/15')
    #   expected_output = { status: false, message: 'card expired', date: Date.today }
    #   expect(subject.withdraw(6, '1234', account, :exp_date, :account_status)).to eq expected_output
    # end 
    # it 'rejects withdrawal if the account is disabled' do
    #   allow(account).to receive(:account_status).and_return(:disabled)
    #   expected_output = { status: false, message: 'account is disabled', date: Date.today }
    #   expect(subject.withdraw(6, '1234', account, :exp_date, :account_status)).to eq expected_output
    # end
    
# end
