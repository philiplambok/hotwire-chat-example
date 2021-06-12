Rails.application.routes.draw do
  resources :chats

  root 'home#index'
end
