class Book < ApplicationRecord
	belongs_to :user
	validates :opinion,length: {maximum: 200, too_long:" not more than 200 characters"}


end
