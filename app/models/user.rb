class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 validates :name,uniqueness: true,presence:true,length: { minimum:2, maximum: 20}
 validates :introduction,length: {maximum: 50}

 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
 attachment :image

has_many :books, dependent: :destroy

end
