Rails.application.routes.draw do
  resources :responses
  resources :questions
  root to: 'responses#new'
end
