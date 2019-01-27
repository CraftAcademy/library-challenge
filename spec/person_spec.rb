require './lib/person.rb'
require 'date'

describe Person do

    let(:library) {instance_double('Library', list: YAML.load_file('./lib/data.yml' ))}

    it 'person need a name in initialize' do
        expect(subject.name).to eq 'sb'
    end

    it 'return_date is given to person' do
        expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:return_date] == true }
        expect(subject.return_date).to be_truthy
    end

    it 'person need to get return_date message' do
        expect(subject.return_date).to eq Date.today.next_month
    end

end