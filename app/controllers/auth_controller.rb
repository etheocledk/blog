class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token

  def register
    begin
      required_params = [ :email, :password, :password_confirmation, :fullname ]

      missing_params = required_params.select { |param| params[param].blank? }
      unless missing_params.empty?
        render json: { success: false, message: "Les champs suivants sont requis : #{missing_params.join(', ')}" }, status: :unprocessable_entity
        return
      end

      user = User.new(
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        fullname: params[:fullname]
      )

      if user.save
        render json: { success: true, message: "Utilisateur créé avec succès." }, status: :created
      else
        render json: { success: false, message: user.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end
end
