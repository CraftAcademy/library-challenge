require 'yaml'
require './lib/library.rb'
require 'date'



describe Library do
    it 'have a collection on initialize' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.collection).to eq expected_output
    end

    it 'when checking out a book the database is updated' do
        expexted_output = collection[0][:available] = false
        expect(subject.book_checkout).to eq expected_output
    end

    it 'when checking in a book the database is updated' do
        expexted_output = collection[0][:available] = false
        expect(subject.book_checkin).to eq expected_output
    end

    it 'gives a list of books by title and author' do
        expected_output = [{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, {:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, {:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, {:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, {:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}]
        expect(subject.book_list).to eq expected_output
    end

    it 'return date is set one month forward' do
        expected_date = Date.today.next_month.strftime('%d/%m/%y')
        expect(subject.exp_return_date).to eq expected_date
    end

    it 'check for the availability of the books' do
        expect(subject.availability).to_not include(false)
    end

    it 'check for the return date of the non available books' do
        expect(subject.not_available).to_not eq nil
    end

end