class Room < ApplicationRecord

  with_options presence: true do
    validates :room_name
    validates :group_name
    validates :introduction
  end

  has_many :room_users
  has_many :users, through: :room_users
end
