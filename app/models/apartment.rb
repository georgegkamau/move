class Apartment < ApplicationRecord 
  validates :street_address, :presence => {message: " cannot be blank."}
  validates :city, :presence => {message: " cannot be blank."}
  validates :state, :presence => {message: " cannot be blank."}
  validates :zip_code, :presence => {message: " cannot be blank."}
 

  belongs_to :user
  has_many :apartment_details, :dependent => :destroy
  

  
end
