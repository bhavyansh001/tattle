class Comment < ApplicationRecord
  has_rich_text :body
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  belongs_to :article
  belongs_to :user
end
