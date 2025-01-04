class CategoriesController < ApplicationController
  def create
    begin
      required_params = [ :name ]

        missing_params = required_params.select { |param| params[param].blank? }
        unless missing_params.empty?
          render json: { success: false, message: "Le nom de la catégorie est réquis." }, status: :unprocessable_entity
          return
        end

        @category = Category.new(
          name: params[:name],
          description: params[:description]
        )

        if @category.save
          render json: { success: true, message: "Catégorie ajoutée avec succès.",  data: @category }, status: :created
        else
          render json: { success: false, message: @category.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end

  def update
    begin
      required_params = [ :name ]

      missing_params = required_params.select { |param| params[param].blank? }
      unless missing_params.empty?
        render json: { success: false, message: "Le nom de la catégorie est réquis." }, status: :unprocessable_entity
        return
      end

      @category = Category.find(params[:id])

      if !@category
        render json: { success: false, message: "La catégorie n'existe pas." }
      end

      @category = @category.update(
        name: params[:name],
        description: params[:description]
      )

      if @category
        render json: { success: true, message: "Catégorie modifié avec succès.", data: @category }, status: :created
      else
        render json: { success: false, message: @category.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end

  def destroy
    begin
      @category = Category.find(params[:id])

      if !@category
        render json: { success: false, message: "La catégorie n'existe pas." }
      end

      if @category.destroy
        render json: { success: true, message: "Catégorie supprimé avec succès." }, status: :created
      else
        render json: { success: false, message: @category.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end

  def show
    begin
      @category = Category.find(params[:id])

      if !@category
        render json: { success: false, message: "La catégorie n'existe pas." }
      end

      render json: { success: true, data: @category  }
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end

  def index
    begin
      @categories = Category.all

      render json: { success: true, data: @categories  }
    rescue StandardError => e
      render json: { success: false, message: "Une erreur est survenue : #{e.message}" }, status: :internal_server_error
    end
  end
end
