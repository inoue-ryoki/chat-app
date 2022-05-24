class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end

# throughオプションは多対多の関連を定義するときに利用する。
# ~を経由するという意味
