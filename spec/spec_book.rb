require './lib/book.rb'

describe Books do
  let(:title) { double(:title, title: 'The book') }
  let(:author) { double(author: author: 'The Author') }

  
