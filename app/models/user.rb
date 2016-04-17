class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :articles, dependent: :destroy
	has_many :comments, as: :commentable
	validates :name, presence: true, length: { maximum: 50 }
	validates :password, presence: true, length: { minimum: 6 }


end
