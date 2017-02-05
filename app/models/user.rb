class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }

  has_one :cookbook
  has_many :recipies
end
