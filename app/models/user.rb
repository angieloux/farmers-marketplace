class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise \
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :trackable,
    :timeoutable, timeout_in: 30.minutes
    

  has_many :listings, dependent: :destroy # a user has many listings, dependent on the destroy method
  validates :name, presence:true # a user needs to have name
  validates :email, presence:true #a user needs to have email

  has_many :purchases, class_name: 'Transaction', foreign_key: 'buyer_id'
  has_many :sales, class_name: 'Transaction', foreign_key: 'seller_id'

  has_many :purchased_listings, through: :purchases, source: :listing
  has_many :sold_listings, through: :sales, source: :listing

  # inner join the relation where there are sales present on transactions table (i.e. when user id == seller_id)
  scope :sellers, -> { joins(:sales) }
  # inner join the relation where there are purchases present on transactions table (i.e. when user id == buyer_id)
  scope :buyers, -> { joins(:purchases) }
end
