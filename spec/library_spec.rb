require './lib/library'

describe Library do

    it 'is expected to contain books' do
        expect(subject.available_books).to be_truthy
    end

    it 'is expected to check out books' do
        title = 'Alfons och soldatpappan'
        expect_output = {status: true, message: 'Enjoy', date: Date.today, exp_date: Date.today + 1.months}
        expect(subject.checkout(title)).to eq expect_output
    end

  
end