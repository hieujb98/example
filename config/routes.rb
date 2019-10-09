Rails.application.routes.draw do
  scope"(:locale)", locale: /en|vi/ do
  root "application#hello"

  get "/home", to: "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/about", to: "static_pages#about"
  get "/new", to: "users#new"
  end
end