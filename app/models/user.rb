class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :communities
  has_many :posts
  has_one :profile
  validates_presence_of :username, :first_name, :last_name
  validates :username, length: {minimum: 6}
  validates_format_of :email,:with => Devise::email_regexp

  def users_full_name
    # embeded name by string interpolation
    "#{first_name} #{last_name}"
  end

end
