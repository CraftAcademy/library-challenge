describe 'Patron' do
  it 'should have a name' do
    expect(subject).to respond_to(:name)
  end

  it 'does something' do
    result = 1 + 1
    expect(result).to eq 2
  end
end
