require './lib/account.rb'
require './lib/books.rb'
require 'yaml'
require 'date'

describe Account do
   let(:user) { instance_double('User', id: '8510316584')}
   subject { described_class.new({owner: user})  }

   it 'has an account owner' do
      expect(subject.owner).to eq user
   end

   it 'checks that account status is set to active' do
         expect(subject.account_status).to eq :active
   end

end