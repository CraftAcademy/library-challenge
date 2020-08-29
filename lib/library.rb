require 'date'
require 'pry'


class Library
  attr_accessor :collection

  def set_collection
    @collection = YAML.load_file('./lib/data.yml')
  end
end