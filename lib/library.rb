require 'yaml'

class Library
  attr_accessor :database

  def initialize
    @database = load_database
  end

  private
  def load_database
    YAML.load_file('lib/data.yml')
  end
end