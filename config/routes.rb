Rails.application.routes.draw do
  resources :posts
  devise_for :users do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  
  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
