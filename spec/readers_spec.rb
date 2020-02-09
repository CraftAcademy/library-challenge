require './lib/readers.rb'
require './lib/library.rb'
require 'pry'


describe Reader do
    subject {described_class.new(name: 'Daniel')}
    let(:library) {instance_double('Library', visitor: subject)}

    #test1
    it 'List of available books' do
        expect(subject.check_avaible?).to_not eq [{:available => false}]
    end


end