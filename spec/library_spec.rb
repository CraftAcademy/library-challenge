require './lib/library'

describe Library do

  let(:user) { double('User') }

  before do
    subject.items.each do |item|
      item[:available] = true
      item[:return_date] = nil
    end
  end

  it 'has a collection of books' do
    expect(subject.items).to be_kind_of Array
  end

  it 'finds item by #title' do
    response = {item: {title: 'Alfons och soldatpappan', author: 'Gunilla Bergström'}, available: true, return_date: nil}
    expect(subject.find_item(title: 'Alfons')).to eq response
  end

  it 'finds item by #author' do
    response = {item: {title: 'Pippi Långstrump', author: 'Astrid Lindgren'}, available: true, return_date: nil}
    expect(subject.find_item(author: 'Lindgren')).to eq response
  end

  context 'an item is found' do
    let(:item) { {item: {title: 'Whatever', author: 'Thomas'}, available: true, return_date: nil} }

    before { allow(user).to receive(:book_shelf).and_return([]) }

    after { subject.check_in(item, user) }

    it 'allows for check-out of :item' do
      response = {title: 'Whatever',
                  author: 'Thomas',
                  checked_out_date: Date.today.strftime('%F'),
                  return_date: Date.today.next_month.strftime('%F')}
      expect(subject.check_out(item, user)).to include response
    end

    it 'rejects check-out if book_shelf has overdue books' do
      overdue_book = [{title: 'Whatever',
                       author: 'Thomas',
                       checked_out_date: Date.today.prev_month.strftime('%F'),
                       return_date: Date.today.prev_month(2).strftime('%F')}]
      allow(user).to receive(:book_shelf).and_return(overdue_book)
      response = {message: 'You have books that are overdue!'}
      expect(subject.check_out(item, user)).to include response

    end

    it 'rejects check-out if item :available = false' do
      item[:available] = false
      response = {message: 'Book is not available'}
      expect(subject.check_out(item, user)).to include response

    end
  end
end
