Rails.application.routes.draw do
  get 'recruits/new'
  get 'recruits/create'
  get 'recruits/show'
  get 'recruits/edit'
  get 'recruits/update'
  get 'recruits/destroy'
  root 'static_pages#home'
  get  '/about' => 'static_pages#about'
  get  '/terms_of_service' => 'static_pages#terms_of_service'
  get  '/privacy_policy' => 'static_pages#privacy_policy'
  get  '/contact' => 'static_pages#contact'
  
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  devise_scope :user do
    post '/users/guest_sign_in' => 'users/sessions#new_guest'
    get  '/users/sign_out' => 'devise/sessions#destroy'
    # get  '/users/:id' => 'users/registrations#show'

  end
  
  resources :users, only: [:show]
  resources :recruits

end
