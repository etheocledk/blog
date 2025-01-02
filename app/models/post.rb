class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes

  validates :title, presence: { message: "Le titre de l'article est requis." },
  length: { maximum: 1000, message: "Le titre de l'article ne peut pas dépasser 255 caractères." },
  format: { with: /\A[a-zA-Z\s]+\z/, message: "Le titre de l'article doit être une chaîne de caractères valide." }

  validates :content, presence: { message: "Le contenu de l'article est requis." }
end
