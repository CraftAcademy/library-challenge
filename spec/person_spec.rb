require './lib/person.rb'

describe Person do

    it 'every customer has a user_id and a pin_code' do
        expect(subject.user_id).not_to be nil
        expect(subject.pin_code).not_to be nil
    end

    it 'every customer has empty book list when created' do 
        expect(subject.reading_list).to be_empty
    end

    it 'every costomer gets a warning when due date has passed' do
        reading_list =[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=> '2018-10-03'}]
        warning = 'Following books are passed due date: Alfons och soldatpappan' 
        expect(subject.check_due_date(reading_list)).to be warning
    end

end