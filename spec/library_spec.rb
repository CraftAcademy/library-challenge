require './lib/library.rb'
require 'yaml' #maybe needs to be here?
require 'date' #don't we need this?

describe Library do
    let(:account) {instance_double('Person', name: 'Christina'), account_status: 'active'}
    subject {described_class.new({borrower: person})}
    #not sure but I think we need to set up user accounts for borrowers?

    #not sure about this 1
    it 'allows checkout if book is available' do
        expect_output = {status: true, message: 'checkout', date: Date.today, title: HARRY POTTER AND THE DEATHLY HALLOWS}
        expect(subject:checkout(HARRY POTTER AND THE DEATHLY HALLOWS, 'Christina', account)) to eq expect_output
    end

    it 'expected to have a return date' do #do we call specific return dates?
        expected_date = Date.today.next_month(30)
        expect(subject.next_month).to eq expected_date
    end # simmillar to atm challenge , might work. 

end