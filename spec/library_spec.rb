require './lib/library.rb'

describe Library do
    let(:visitor) { instance_double('Visitor', set_id: '1') }


    it 'Whole collection of books in library' do
        expect(subject.collection).not_to eq nil
    end



end

