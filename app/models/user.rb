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
    

  has_many :listings, dependent: :destroy
  validates :name, presence:true #needs to have name
  validates :email, presence:true #needs to have email

end
