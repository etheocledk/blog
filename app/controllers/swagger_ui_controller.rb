class SwaggerUiController < ApplicationController
  def index
    render json: Swagger::Docs::Config.api_docs["v1"]
  end
end
