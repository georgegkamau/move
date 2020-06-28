class ApartmentDetail < ApplicationRecord 
  # 
  validates :housing_type, :rent, :deposit, :bedrooms, :bathrooms, :available, on: :update, :presence => {message: " cannot be blank."}
  # validates :name, :housing_type, :rent, :deposit, :bedrooms, :bathrooms, :available, :pets, presence: true, on: :update 
  # validates :zip_code, :presence => {message: " cannot be blank."}
  # validates :age, numericality: true, on: :update
 
 
  #
  belongs_to :apartment
  has_many_attached :pictures, :dependent => :destroy
  has_many_attached :videos, :dependent => :destroy

  
end
