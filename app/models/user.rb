class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name

  validates :name, length: {minimum: 2}, presence: true
  validates :name, length: {maximum: 20}

  validates :introduction, length: {maximum: 50}
end
