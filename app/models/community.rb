class Community < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates_presence_of :url, :name, :description

end
