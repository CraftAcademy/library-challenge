describe 'Person' do

  subject { described_class.new(name: 'Lisa') }

  it 'should have a name' do
    expect(subject).to respond_to(:name)
  end


end
