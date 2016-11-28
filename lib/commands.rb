load './lib/person.rb'
load './lib/library.rb'
lib = Library.new
p = Person.new
lib.check_in({title: 'Programming', author: 'Thomas'})
p.rent(lib, title: 'Programming')