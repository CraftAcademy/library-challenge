require './lib/person'
require 'yaml'

describe Person do

  subject { described_class.new(name: 'Lisa' ) }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected a person can select books to loan' do
    expect(subject.loan_books(books)).to eq expected output
  end

=begin
  it 'can create an Account' do
    before { subject.create_account }
  end

  it 'can manage books record' do
    let (:books) { Library.new }
    before { subject.create_account }
  end
=end

end
