class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 validates :name,uniqueness: true,length: { minimum:2, maximum: 20,too_long:" not more than 20 characters"}
 validates :introduction,length: {maximum: 50, too_long:" not more than 50 characters"}

 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
 attachment :image

has_many :books, dependent: :destroy

end
