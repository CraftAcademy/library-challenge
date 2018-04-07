require './lib/library.rb'

describe Library do

it 'displays the list of books'do
  expected_output = YAML.load_file('./lib/data.yml')
  expect(subject.list).to eq expected_output
end

end
