class Listing < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_one_attached :image # trigger active storage 

  validates :name, presence:true #needs to have name
  validates :price, presence:true #needs to have price
  validates :category, presence:true # needs to have category

  # scope :bargains, -> {where(price: 1000)}
  scope :sold, -> { joins(:transactions)}


  # name length 
  # numericality for price 
  # comment belongs_to user 
  # listing has many comments 


end
