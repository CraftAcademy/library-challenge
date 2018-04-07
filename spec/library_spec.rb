require './lib/library.rb'

describe Library do

it 'displays the list of books'do
  expect(subject).to respond_to(list)
end

end
