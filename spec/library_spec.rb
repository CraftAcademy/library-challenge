require 'library.rb'

    describe Library do
        subject { described_class.new }

        it 'expects a library to have a list of its books' do
            expect(subject.list).not_to be nil
        end
    end
