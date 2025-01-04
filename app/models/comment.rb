class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: { message: "Le contenu de l'article est requis." }

  validates :user_id, presence: { message: "L'id du commentateur est requis." }

  validates :post_id, presence: { message: "L'id du post est requis." }
end
