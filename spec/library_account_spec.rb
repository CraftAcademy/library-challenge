require './lib/library_account.rb'
require 'date'
require 'books.yml'

describe Library_account do
    let(:account) {instance_double('Person', name: 'Christina'), account_status: 'active'}
    subject {described_class.new({user: person})}
    #not sure but I think we need to set up user accounts for borrowers? plus are there extra brackets above?

    it 'allows checkout if account status is active' do
        expect_output = {status: 'active' message: 'checkout', date: Date.today, title: HARRY POTTER AND THE DEATHLY HALLOWS}
        expect(subject:checkout(HARRY POTTER AND THE DEATHLY HALLOWS, 'Christina', account)) to eq expect_output
    end

    it 'is expected to have a user who is the borrower' do
        expect(subject.borrower).to eq person
    end

   