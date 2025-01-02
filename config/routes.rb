Rails.application.routes.draw do
  # https://guides.rubyonrails.org/routing.html

  post "/register", to: "auth#register"
end
