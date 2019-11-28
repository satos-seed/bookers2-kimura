class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    has_many :books, dependent: :destroy
    validates :name, presence: true #(空白NG)
    validates :name, length: { :minimum => 2, :maximum => 20 }
    validates :introduction, length: { :maximum => 50 }
    attachment :profile_image

    has_one_attached :image

end
