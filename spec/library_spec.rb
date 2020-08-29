require './lib/library.rb'
require 'date'

describe Library do

    it 'shows a list of books' do
        expect(subject.catalogue).to_not eq nil
    end

    it 'shows a list of titles and author of books' do
        expect(subject.show_title_author).to_not eq nil
    end

end

