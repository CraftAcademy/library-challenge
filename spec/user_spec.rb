
require 'yaml'
require './lib/user.rb'
require './lib/library.rb'
require 'date'

describe User do

    let (:user) { instabce_double('User', name: 'Paulina')}
    subject { described_class.new({})}
   
    it 'gets a return date of the book' do
        subject.return_date
        expect(subject.return_date).to eq Date.today.next_month(1).strftime("%m/%y")
        end
end
