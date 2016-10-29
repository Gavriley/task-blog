class Category < ActiveRecord::Base
	has_many :categories_posts
  has_many :posts, :through => :categories_posts

  scope :latest, -> { order(id: :desc) }

  validates :name, :uniqueness => 
  											{ message: 'Дана категорія вже існує.' }, 
  									:length =>
  											{ minimum: 3, message: "Мінімум 3 символи." }
end	