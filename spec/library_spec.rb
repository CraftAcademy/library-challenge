require './lib/library.rb'
RSpec.describe Library do
  subject { described_class.new }

  it 'is expected to have books' do
    expect(subject.all_books).to be_truthy
  end
end
