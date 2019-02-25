class ApiKey
  def self.create_key
    SecureRandom.hex(15)
  end
end
