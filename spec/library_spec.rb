require './lib/library'

describe Library do
  items = [{ title: 'Alfons leker', author: 'A. Andersson' },
           { title: 'Bible', author: 'TGAOTU' } ]
  subject { described_class.new(items: items)}
  let(:user) { double('User') }

  it 'has a collection of books' do
    expect(subject.items).to be_kind_of Array
  end

  it 'finds and allows check out by #title' do
    item = { title: 'Alfons leker' }
    response = { item: { title: 'Alfons leker', author: 'A. Andersson' },
                 lender: user,
                 checked_out_date: Date.today.strftime('%F'),
                 return_date: Date.today.next_month.strftime('%F')}

    expect(subject.check_out(user, item)).to eq response
  end

  it 'finds and allows check out by #author' do
    item = { author: 'TGAOTU' }
    response = { item: { title: 'Bible', author: 'TGAOTU' },
                 lender: user,
                 checked_out_date: Date.today.strftime('%F'),
                 return_date: Date.today.next_month.strftime('%F')}

    expect(subject.check_out(user, item)).to eq response
  end
end
