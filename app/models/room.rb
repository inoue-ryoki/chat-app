class Room < ApplicationRecord
    has_many :room_users
  has_many :users, through: :room_users

  validates :name, presence: true
end

# throughオプションは多対多の関連を定義するときに利用する。
# ~を経由するという意味
