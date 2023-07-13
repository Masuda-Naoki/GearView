class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def customer_address_display
    '〒' + zip_code + ' ' + address
  end
  
  def full_name
    last_name + first_name
  end
  
  def full_kana_name
    last_kana_name + first_kana_name
  end
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :last_name, length: { minimum:2, maximum:20 }, presence:true 
  validates :first_name, length: { minimum:2, maximum:20 }, presence:true
  validates :last_kana_name, length: { minimum:2, maximum:20 }, presence:true
  validates :first_kana_name, length: { minimum:2, maximum:20 }, presence:true
  validates :zip_code, presence:true
  validates :address, presence:true
  validates :phone_number, presence:true, uniqueness: true
  validates :email,  presence:true, uniqueness: true
  validates :encrypted_password, presence:true
end
