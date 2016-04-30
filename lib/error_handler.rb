module ErrorHandler

  def self.alert(error_message)
    raise ArgumentError, error_message
  end

end
