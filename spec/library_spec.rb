require './lib/library.rb'

describe Library do

  it 'is an array' do
    expect(subject.book_list).to be_instance_of(Array)
  end

  it 'return a collection of 1 or more books' do
    expect(subject.book_list.length).to be > 0
  end

  it 'allow check_out of book' do
    expected_output = { status: true, message: 'check_out complete', book_id: 1234, date: Time.now.strftime('%Y-%m-%d_%H-%M-%S') }
    expect(subject.perform_check_out).to eq expected_output
  end

end
