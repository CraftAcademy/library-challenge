require './lib/book'

describe Books do
  books = [{ title: 'managment101', author: 'rich' }, { title: 'cooking101', author: 'fat'}]


  it 'constract of empty array at start' do
   Books = []
  #  expect(subject.initialize).to be_kind_of Array
  end

  it 'searched by :title' do
  subject.search_by_title(title: 'cooking101')
      expect(subject.search_by_title).to eq [{title: 'cooking101', author: 'fat' }]
  end

 it 'searched by :author' do
  subject.search_by_author(fat)
        expect(search_by_author).to eq [{title: 'cooking101', author: 'fat' }]
 end
end
