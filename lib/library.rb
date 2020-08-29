require 'yaml'
require 'date'

class Library
    attr_accessor :catalogue, :exp_date

    def initialize 
        @catalogue = YAML.load_file('./lib/data.yml')
    end

    def catalogue
        @catalogue
    end

    def show_title_author 
        for i in 0..4
            puts catalogue[i][:item]
        end
    end

    
end


=begin
 book = {
    lord_of_rings: 'Tolkien',
    harry_Potter: 'jKR',
    pippi: 'Astrid Lindgren'
}
    book.each do |title, author| 
    puts "#{title} written by #{author}"
    end
end
=end