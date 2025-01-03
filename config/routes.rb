Rails.application.routes.draw do
  # https://guides.rubyonrails.org/routing.html

  namespace :auth do
    post "/signup", to: "auth#signup"
    post "/validate-email", to: "auth#validateEmail"
    post "/login", to: "auth#login"
    post "/logout", to: "auth#logout"
    post "/password-reset/request", to: "auth#requestResetPassword"
    post "/password-reset/change", to: "auth#changePassword"
  end

  resources :categories, only: [ :index, :show, :create, :update, :destroy ]

  get "/api-docs", to: "swagger_ui#index"
end
