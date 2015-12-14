class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  
  validates :name,
            presence: true,
            length: {maximum: 50}


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            format: {with: VALID_EMAIL_REGEX },
            presence: true,
            length: {maximum: 255},
            uniqueness: { case_sensitive: false }



end
