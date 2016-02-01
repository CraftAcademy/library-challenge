require './lib/library'

describe Library do

  let(:user) { double('User') }

  it 'has a collection of books' do
    expect(subject.items).to be_kind_of Array
  end

  it 'finds item by #title' do
    response = {item:{ title: 'Alfons leker', author: 'A. Andersson' }, available: true, return_date: nil}
    expect(subject.find(title: 'Alfons leker')).to eq response
  end

  it 'finds item by #author' do
    response = {item: { title: 'Bible', author: 'TGAOTU' }, available: true, return_date: nil}
    expect(subject.find(author: 'TGAOTU' )).to eq response
  end

  context 'an item is found' do
    let(:item) { {item: { title: 'Bible', author: 'TGAOTU' }, available: true, return_date: nil} }

    before { allow(user).to receive(:book_shelf).and_return([]) }

    after { subject.check_in(item, user) }


    it 'allows for check-out of :item' do
      response = {title: "Bible",
                  author: "TGAOTU",
                  checked_out_date: Date.today.strftime('%F'),
                  return_date: Date.today.next_month.strftime('%F')}
      expect(subject.check_out(item, user)).to include response
    end


  end

end
