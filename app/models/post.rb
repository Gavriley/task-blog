class Post < ActiveRecord::Base

	has_many :categories_posts
  has_many :categories, :through => :categories_posts
  has_many :comments, dependent: :destroy
  
	scope :latest, -> { order(created_at: :desc).includes(:comments).includes(:categories) }
	scope :published_posts, -> { where(published: true).order(created_at: :desc) }

	has_attached_file :thumbnail, styles: { :large => '300x300>', :medium => '200x200>', :small => '150x150>' }
	validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/

	validates :title, length: { maximum: 70, message: "Завеликий заголовок(максимум 70 символів)" }, 
		presence: { message: "Заповніть поле заголовок"  }
	
	def self.search(query)
		where("LOWER(posts.title) LIKE LOWER(?) OR LOWER(posts.content) LIKE LOWER(?)", "%#{query}%", "%#{query}%")
	end

	def self.search_published_posts(query)
		where(published: true).where("LOWER(posts.title) LIKE LOWER(?) OR LOWER(posts.content) LIKE LOWER(?)", "%#{query}%", "%#{query}%")
	end
	
end	