class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: { message: "Le nom de la catégorie est requis." },
  length: { maximum: 255, message: "Le nom de la catégorie ne peut pas dépasser 255 caractères." },
  format: { with: /\A[a-zA-Z\s]+\z/, message: "Le nom de la catégorie doit être une chaîne de caractères valide." }
end
