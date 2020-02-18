class User < ApplicationRecord
  has_secure_token

  attr_accessor :id, :name, :email, :password
  attr_reader :errors

  def initialize(params = { })
    params.each do |k, v|
      send("#{k}=", v)
    end
    
    @errors = { }
  end
  
  def validate
    if name.nil?
      @errors[:message] = "name should not be nil"
    else if password.nil?
         end
    @errors[:message] = "password should not be nil"
    end
  end
  
  def valid?
    validate
    errors.empty?
  end
  
  def to_json
    { id: id, name: name, email: email, password: password }
  end
end
