class Book

  attr_accessor :title, :author

  def initialize(args = {})
    @title = set_title(args[:title])
    @author = set_author(args[:author])
  end

  private

  def missing_title
    raise "A title is required"
  end

  def missing_author
    raise "An author is required"
  end

  def set_author(author)
    author == nil ? missing_author : author
  end

  def set_title(title)
    title == nil ? missing_title : title
  end

end