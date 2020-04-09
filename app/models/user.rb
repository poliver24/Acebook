class User < ApplicationRecord
has_many :posts 
EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_presence_of :name, :message => 'You Must Enter a Name'
  validates_presence_of :email, :message => 'You Must Enter an Email Address'
  validates_uniqueness_of :email, :message => 'This email already exists' 
  validates :email, :format => EMAIL_REGEX
  validates_presence_of :password, :message => 'You Must Enter a Password'
  validates_length_of :password, :in => 6..10, :on => :create

  has_secure_password
end
