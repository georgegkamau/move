class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #
  #
  # validates :name, :login, :email, presence: true  
  validates :first_name, presence: {message: " cannot be blank."}
  validates :last_name, :presence => {message: " cannot be blank."}
  validates :email, :presence => {message: " cannot be blank."}

  has_many :apartments, :dependent => :destroy
  

end
 