require 'yaml'
books = YAML.load_file('./lib/data.yml')


class Books
    attr_accessor :item

    def initialize
      @item = YAML.load_file('./lib/data.yml')
    end
end



# attr_accessor :title, :author, :available, :return_date 

#attr_accessor :books 

  #  def self.perform_action! specific_name
   #     init = YAML.load_file('./lib/data.yml')[specific_name]
   #     input = init[:item]
    #    result = eval(input)
   # end

   # def initialize
     #   @books = 'Books'
  #  end

#YAML.load_file(./lib/data.yml)