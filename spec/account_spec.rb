require './lib/account.rb'
require './lib/books.rb'
require 'yaml'
require 'date'

describe Account do
   let(:user) { instance_double('User', id: '8510316584')} # Creating a fake user
   subject { described_class.new({owner: user})  } # Connecting user as owner of account

   it 'has an account owner' do
      expect(subject.owner).to eq user
   end

   it 'checks that account status is set to active' do
         expect(subject.account_status).to eq :active
   end
   
   
   # it 'changes availability of book' do
   #    expected_output = false
   #    expect(subject.checkout(item)).to eq expected_output
   # end

   # it 'checks that books borrowed get return date on initialize (checkout)' do
   #    expected_date = Date.today + 30
   #    #expected_date = Date.today.next_year(5).strftime('%d/%m/%y') expect(subject.exp_date).to eq expected_date
   # end

   # it 'sets book as unavailable on initialize (checkout)' do
   #    # Ex. expect(subject.account_status).to eq :active
   # end

   # it 'displays list of currently borrowed books' do
   #    # Some supersmart code
   # end

end