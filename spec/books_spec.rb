# require './lib/account.rb'
# require './lib/data.yml'
require './lib/books.rb'
require 'pry-byebug'
# require 'date'
require 'yaml'
require 'pry'

describe Books do

    it 'are there books in the library' do
    expect(subject.item).not_to eq nil
    end

    it 'can search book list by title' do
    expect(subject.item[1][:item][:title]).to include("Skratta la")
    end

    it 'can search book list by author' do
        expect(subject.item[1][:item][:title]).to include("Skratta la")
    end

    it 'can check if a book is available' do
        expected_output = false
        expect(subject.item[1][:available]).to eq expected_output
    end
    
end