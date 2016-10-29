class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	scope :latest, -> { order(created_at: :desc).includes(:post).includes(:user) }
	
	validates :content, :length => 
  												{ maximum: 800, too_long: "Максимальний розмір коментаря 600 символів" },
  										:presence =>
  												{ message: "Заповніть поле коментаря" }

  def self.search(query)
  	joins(:user).joins(:post).
			where("LOWER(comments.content) LIKE LOWER(?) OR LOWER(posts.title) LIKE LOWER(?) OR LOWER(users.login) LIKE LOWER(?)", "%#{query}%", "%#{query}%", "%#{query}%")
	end	

end	