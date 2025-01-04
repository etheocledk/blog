class LikesController < ApplicationController
  def toggleLike
    begin
      required_params = [ :content_id, :user_id, :post_id ]

      missing_params = required_params.select { |param| params[param].blank? }
      unless missing_params.empty?
        render json: { success: false, message: "Les champs suivants sont requis : #{missing_params.join(', ')}" }, status: :unprocessable_entity
        return
      end

      @like = Like.new(
        content_id: params[:content_id],
        user_id: params[:user_id],
        post_id: params[:post_id]
      )

      if @like.save
        render json: { success: true, message: "Commentaire liké avec succès." }, status: :created
      else
        render json: { success: false, message: @like.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end
end
