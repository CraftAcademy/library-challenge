require "./lib/library.rb"
require'date'



describe Library do
    
it 'has 5 books on initialization' do
    expect(subject.catalogue).to eq 5
end



end

