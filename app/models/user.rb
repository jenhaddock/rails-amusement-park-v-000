class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  after_initialize :default_values

  def mood
     if nausea > happiness
       "sad"
     else
       "happy"
     end
  end
  
  private
    def default_values
      self.admin ||= false
    end
end
