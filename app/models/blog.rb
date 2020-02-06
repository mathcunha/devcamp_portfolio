class Blog < ApplicationRecord
  enum status:{draft:0, published:1}
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :topic
end
