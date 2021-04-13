class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :communities
  has_many :posts
  has_one :profile
  has_many :courses
  validates_presence_of :username, :first_name, :last_name
  validates :username, length: {minimum: 6}
  validates_format_of :email,:with => Devise::email_regexp
  after_create :build_profile

  # after creation above...build profile
  def build_profile
    Profile.create(user: self)
  end

end
