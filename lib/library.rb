 require 'yaml'

class Library
  attr_reader :list, :title

  def initialize
    @list = YAML.load_file('./lib/data.yml')
  end

  def search_title(title)
    @list.select {|obj| obj[:item][:title] == title}
  end
  def search_author(author)
    @list.select {|obj| obj[:item][:author] == author}
  end

end
