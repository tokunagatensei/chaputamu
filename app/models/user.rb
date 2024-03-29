class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name,         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name,        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :birth_date
  end

  validates :password,            format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, allow_blank: true

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
