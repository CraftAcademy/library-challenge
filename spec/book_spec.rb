require './lib/book.rb'

describe Book do
  let (:book) {Book.new('managment 101', 'rich')}


  it 'should respond to title' do
    expect(book).to respond_to :title
    expect(book.title).to eq 'managment 101'
  end

  it 'should respond to author' do
    expect(book).to respond_to :author
    expect(book.author).to eq 'rich'
  end


#  it 'searched by :title' do
#    subject.search_by_title(title: 'managment 101')
#      expect(subject.search_by_title).to eq [{title: 'managment 101', author: 'rich' }]
 #end

#  it 'searched by :author' do
#    book.search_by_author(fat)
#        expect(search_by_author).to eq [{title: 'managment 101', author: 'rich' }]
#  end
end
