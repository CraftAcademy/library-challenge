load './lib/library.rb'
load './lib/person.rb'
kth = Library.new
p1 = Person.new('john', 8313213)
kth.checkout(1,p1)
kth.checkout(3,p1)
puts kth.books
puts p1.books
