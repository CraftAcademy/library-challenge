require "./lib/library.rb"
require'date'



describe Library do
    
it 'check for available book catalogue' do
    expect(subject.catalogue).to_not eq nil 
end



end

