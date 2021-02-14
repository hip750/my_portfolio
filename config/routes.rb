Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about' => 'static_pages#about'
  get  '/terms_of_service' => 'static_pages#terms_of_service'
  get  '/privacy_policy' => 'static_pages#privacy_policy'
  get  '/contact' => 'static_pages#contact'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  
  devise_scope :user do
    post '/users/guest_sign_in' => 'sessions#new_guest'
  end

  get  resources :users, only: [:show]
end
