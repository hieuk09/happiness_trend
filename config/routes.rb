Rails.application.routes.draw do
  resources :responses, only: [:index, :new, :create]
  root to: 'responses#new'
end
