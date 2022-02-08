Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root "articles#index"

  resources :articles do
    resources :comments, :except => [:show]
  end


  get '/articles/:article_id/comments/:id/edit/', to: 'comments#show'
end
