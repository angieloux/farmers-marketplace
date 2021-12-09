class Listing < ApplicationRecord
  belongs_to :user
  validates :name, presence:true #needs to have name
  validates :price, presence:true #needs to have price
  validates :category, presence:true # needs to have category

  
  has_one_attached :image # trigger active storage 

  # name length 
  # numericality for price 
  # comment belongs_to user 
  # listing has many comments 


end
