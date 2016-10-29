class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :comments, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
  			 :confirmable, :lockable, :timeoutable, 	
         :recoverable, :rememberable, :trackable, :validatable

  scope :latest, -> { order(created_at: :desc) }  

  validates :login, :uniqueness => 
  											{ message: 'Даний логін вже використовується.' },   
  									:format => 
  											{ with: /^[a-zA-Z0-9_\.]*$/, multiline: true, message: "В логіні присутні недопустимі символи." },
  									:length => 
  											{ within: 3..20, too_short: "Мінімум 3 символи повинен містити логін", too_long: "Максимальний розмір логіна 20 символів" },
                    :presence => 
                        { message: 'Введіть логін' }  

  validates :name, :length => 
                        { within: 2..20, too_short: "Мінімум 2 символи повинене містити імя", too_long: "Максимальний розмір імені 20 символів" },
                    :presence => 
                        { message: 'Введіть імя' }                              

  has_attached_file :avatar, styles: { :large => '300x300>', :medium => '100x100>', :small => '60x60>' }, default_url: "/system/users/avatars/:style/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/  

  def self.search(query)
    where("LOWER(users.login) LIKE LOWER(?) OR LOWER(users.name) LIKE LOWER(?) OR LOWER(users.email) LIKE LOWER(?)", "%#{query}%", "%#{query}%", "%#{query}%")
  end   
end
