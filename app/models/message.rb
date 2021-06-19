class Message < ApplicationRecord
  belongs_to :room

  scope :recently_posted_order, -> { order(created_at: :desc, id: :desc) }

  validates :content, presence: true
end
