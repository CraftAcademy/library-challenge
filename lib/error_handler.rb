module ErrorHandler

  def self.alert(error_message)
    fail ArgumentError, error_message
  end

end
