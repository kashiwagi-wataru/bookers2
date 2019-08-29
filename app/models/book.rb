class Book < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :tags, dependent: :destroy
	# has_many :tags, :dependent: :destroy
	
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	accepts_nested_attributes_for :tags


	def favorited_by?(user)
		favorites.where(user_id:user.id).exists?
	end
end