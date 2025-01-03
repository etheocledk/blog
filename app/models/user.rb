class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_one_attached :avatar

  # Sécurisation du mot de passe
  has_secure_password

  before_validation :downcase_email


  # Validation de l'email
  validates :email, presence: { message: "L'email ne peut pas être vide." },
                    uniqueness: { message: "Cet email est déjà pris." },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Veuillez entrer un e-mail valide." }

  # Validation du mot de passe
  validates :password, presence: { message: "Le mot de passe ne peut pas être vide." },
                       length: { minimum: 8, message: "Le mot de passe doit contenir au moins 8 caractères." },
                       format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}\z/,
                                 message: "Le mot de passe doit contenir au moins une lettre majuscule, une lettre minuscule, un chiffre et un caractère spécial." }

  # Validation du nom complet
  validates :fullname, presence: { message: "Le nom est requis." },
                       length: { maximum: 255, message: "Le nom ne peut pas dépasser 255 caractères." },
                       format: { with: /\A[a-zA-Z\s]+\z/, message: "Le nom doit être une chaîne de caractères valide." }

  # Validation du numéro de téléphone
  validates :phone_number, format: { with: /\A[0-9]{10,15}\z/, message: "Le numéro de téléphone doit contenir entre 10 et 15 chiffres." }

  # Validation de l'avatar
  validates :avatar, presence: { message: "L'avatar ne peut pas être vide." },
                     content_type: { in: [ "image/png", "image/jpg", "image/jpeg" ], message: "L'avatar doit être une image de type PNG, JPG ou JPEG." },
                     size: { less_than: 10.megabytes, message: "L'avatar ne doit pas dépasser 10 Mo." }


  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
