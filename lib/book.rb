class Book

  attr_accessor :title, :author

  def initialize(args = {})
    @title = args[:title]
    @author = args[:author]
  end

end