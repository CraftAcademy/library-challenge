require './lib/keeper.rb'
require 'date'
require './lib/customer.rb'


describe Customer do
    let(:name) {'Arun'}

    let:(:keeper){instance_double}('Keeper', books: [])
    subject{Customer.new(name)}

   


    





end