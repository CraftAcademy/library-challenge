require './lib/library.rb'
require 'date'


describe Person do
    let(:account) { instance_double('Person', password: '1234', borrowed_book: 'title') }
    let(:person) {instance_double('Person', name: 'Thomas')}
    subject { described_class.new({owner: person}) }

    it 'check the length of a number' do
        number = rand(1000..9999)
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
    end


#     it 'is expected to have borrowed books on initialize' do
#         expect(subject.borrowed_book).to eq :title
#     end 

#     it 'is expected to have an owner' do
#         expect(subject.owner).to eq person
#     end

#     it ' is expected to raise error if no owner is set' do
#         expect { described_class.new }.to raise_error 'An Account owner is required'
#     end
 end