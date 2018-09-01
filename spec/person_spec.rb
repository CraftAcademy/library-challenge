# 1As an  individual
# 2In order to get my hands on a good  book
# 3I would  like to see a list of books  currently  available  in the  library
# 4with  information  about  the  title  and  author

# 1As an  individual
# 2In order to avoid  awkward  moments  at the  library
# 3I would  like to know  when my book is  supposed  to be  returned
require './lib/person'

describe Person do
    subject { described_class.new(name: 'Zangoel')}

    it 'is expected to have a :name on initialize' do
        expect(:name).not_to be(nil)
    end

end