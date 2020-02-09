require './lib/library.rb'
require 'date'

describe Library do
  let(:person) { instance_double('Person', password: '1234') }
  

  it 'can search book list by title' do
    expect(subject.select_book("Skratta lagom! Sa pappa Åberg")).to be_truthy
  end

  it 'show a list of available book' do
    expect(subject.available_book("Pippi Långstrump")).to be_truthy
  end

  it 'show the due date at borrowing' do
    expect(subject.due_date)
  end
end


