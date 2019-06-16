require './lib/visitor.rb'
require './lib/library.rb'

class Book
    attr_accessor :available, :title, :author, :return_date

    def initialize(attrs = {})
        set_title(attrs[:title])
        set_author(attrs[:author])
        @available = true
        @return_date = nil #changing from due_date to return_date since that is the attribute in the data.yaml file. Also adding nil cause a book shouldn't have a return date when initialized
    end

    def set_title(obj)
        obj == nil ? missing_title : @title = obj.to_s
    end

    def missing_title
        raise "A title is required"
    end

    def set_author(obj)
        obj == nil ? missing_author : @author = obj.to_s
    end

    def missing_author
        raise "An author is required"
    end

    # How can we link this class to the data.yaml file so that the new books
    #are created are added to that list?

    # try 1:

    def add_book #method is working but it's overwriting info in data.yml instead of adding
        collection = YAML.load_file('./lib/data.yml')
        new_book = { 
            item: { title: @title, author: @author } ,
            available: @available,
            return_date: @return_date }
        collection << new_book
        File.open("./lib/data.yml", "w") { |file| file.write(collection.to_yaml) }
    end

    # try 2

    # def add_book
    #     convert_yaml = YAML::load_file("./lib/data.yml")
    #     pp
    #     #convert_yaml[item][available][return_date]
    #     convert_yaml['item'] = { 'item' =>
    #     [{'title'=>@title,
    #     'author'=>@author}]},
    #     convert_yaml['available'] = { 'available' => [@available]},
    #     convert_yaml['return_date'] = @return_date,
    #     File.open('./lib/data.yml', “w”){|f| YAML.dump(convert_yaml, f)}
    # end

    def check_out
        @availabe = false
        @return_date = "2019-08-17" #FIXME: now + 2 months
     end

    # def check_in
    #     @available = true
    # end

    # def get_due_date
    #     due_date
    # end

    #for listing
    def to_string
        @title + " by " + @author + "is available: " + @available
    end
end
