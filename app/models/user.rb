class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  validates :username, :presence => true, :uniqueness => true, :length => { :in => (3..20) }
  validates :password, :confirmation => true
  validates :password, :length => { :in => (6..20) }, :on => :create

  has_many :urls
end
