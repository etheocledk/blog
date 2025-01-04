class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :comment

  validates :comment_id, presence: { message: "L'id du commentaire est requis." }

  validates :user_id, presence: { message: "L'id du commentateur est requis." }

  validates :post_id, presence: { message: "L'id du post est requis." }
end
