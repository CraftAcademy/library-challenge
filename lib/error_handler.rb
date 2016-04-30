module ErrorHandler

  def self.alert(error_message)
    raise RuntimeError, error_message
  end

end
