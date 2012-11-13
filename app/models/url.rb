class Url < ActiveRecord::Base
  attr_accessible :original, :short, :view_count, :user_id
  validates :original, :presence => true
  validates :original, :format => { :with => /http:\/\/|https:\/\// }
  validates :short, :presence => true
  validates :short, :uniqueness => true
  validates :user_id, :presence => true

  belongs_to :user
end