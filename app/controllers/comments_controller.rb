class CommentsController < ApplicationController
  def create
    begin
      required_params = [ :content, :user_id, :post_id ]

        missing_params = required_params.select { |param| params[param].blank? }
        unless missing_params.empty?
          render json: { success: false, message: "Les champs suivants sont requis : #{missing_params.join(', ')}" }, status: :unprocessable_entity
          return
        end

        @comment = Comment.new(
          content: params[:content],
          user_id: params[:user_id],
          post_id: params[:post_id]
        )

        if @comment.save
          render json: { success: true, message: "Commentaire ajouté avec succès." }, status: :created
        else
          render json: { success: false, message: @comment.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end

  def destroy
    begin
      @comment = Comment.find(params[:id])

      if !@comment
        render json: { success: false, message: "Le commentaire n'existe pas." }
      end

      if @comment.destroy
        render json: { success: true, message: "Commentaire supprimé avec succès." }, status: :created
      else
        render json: { success: false, message: @comment.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end

  def update
    begin
      required_params = [ :content ]

      missing_params = required_params.select { |param| params[param].blank? }
      unless missing_params.empty?
        render json: { success: false, message: "Le contenu du commentaire est réquis." }, status: :unprocessable_entity
        return
      end

      @comment = Comment.find(params[:id])

      if !@comment
        render json: { success: false, message: "Le commentaire n'existe pas." }
      end

      @comment = @comment.update(
        content: params[:content]
      )

      if @comment
        render json: { success: true, message: "Commentaire modifié avec succès.", data: @comment }, status: :created
      else
        render json: { success: false, message: @category.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end

  def show
    begin
      @comment = Comment.find(params[:id])

      if !@comment
        render json: { success: false, message: "Le commentaire n'existe pas." }
      end

      render json: { success: true, data: @comment  }
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end
end
