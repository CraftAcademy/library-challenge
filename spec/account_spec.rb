require './lib/account.rb'
require './lib/books.rb'
require './lib/data.yml' 
require 'date'

describe Account do
   let(:user) { instance_double('User', id: '8510316584')} # Creating a fake user
   subject { described_class.new({owner: user})  } # Connecting person as owner of account

   it 'has an account owner' do
      # Ex: expect(subject.owner).to eq person
   end

   it 'checks that account status is set to active' do
      # Ex: expect(subject.account_status).to eq :active
   end

   it 'checks that books borrowed get expiry date on initialize (checkout)' do
      # Ex. expected_date = Date.today.next_year(5).strftime("%m/%y") expect(subject.exp_date).to eq expected_date
   end

   it 'sets book as unavailable on initialize (checkout)' do
      # Ex. expect(subject.account_status).to eq :active
   end

   it 'displays list of currently borrowed books' do
      # Some supersmart code
   end

   it 'rases error if date is due for return of book' do
      # Ex. expect { described_class.new }.to raise_error 'An Account owner is required'
   end

   it 'deactivates account on initialize' do
      # Ex. subject.deactivate expect(subject.account_status).to eq :deactivated
   end

end