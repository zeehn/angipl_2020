Rails.application.routes.draw do
  resources :words, only: :index
end
