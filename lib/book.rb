require 'yaml'

class Book
  STANDARD_VALIDITY_DAYS = 30
  attr_accessor :exp_date#, :visitor

  def initialize(attrs = {})
    @exp_date = set_return_date
    # @visitor = visit_library(attrs[:visitor])
  end

  def collection
    YAML.load_file('./lib/data.yml')
  end

  def set_return_date
    Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('Any books have to be returned by: %d/%m/%y')
  end

  def search(title)
    collection.select { |obj| obj[:item][:title].include? title  }
  end

  # def visit_library(visitors)
  #     visitors == nil ? no_visitors : visitors
  # end

  # def no_visitors
  #   raise 'There are no visitors.'
  # end

end