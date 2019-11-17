require './lib/library_main.rb'
describe Library_main do
  #let(:visitor) {instance_double('visitor')
  subject { described_class.new }

  it 'expects a library to have a list of its books' do
    expect(subject.collection).not_to be nil
    puts subject.collection
  end

  it 'check available' do
    puts subject.check_avl("Alfons och soldatpappan","aa")
    #expect(subject.check_avl("Alfons och soldatpappan","aa") ).to eq 'true'
    
  end
end
