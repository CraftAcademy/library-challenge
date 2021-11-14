require 'yaml'
collection = YAML.load_file('./lib/database.yaml')


# To start with, we mofify the first object in the collection by setting `:available` to `false`
collection[0][:available] = false
File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
 => 567


puts "Your book was borrowed on #{start_da} and is due backon #{end_date}."