Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root "articles#index"

  resources :articles do
    resources :comments, :only => [:create, :destroy]
  end
end
