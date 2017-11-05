require './lib/person'
require 'yaml'

describe Person do

  subject { described_class.new(name: 'Lisa' ) }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

=begin
  it 'can manage books record' do
    let (:books) { Library.new }
    before { subject.create_account }
  end
=end

end
