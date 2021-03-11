Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about'            => 'static_pages#about'
  get  '/terms_of_service' => 'static_pages#terms_of_service'
  get  '/privacy_policy'   => 'static_pages#privacy_policy'
  
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations:      'users/registrations',
    sessions:           'users/sessions',
    passwords:          'users/passwords'
  }
  
  devise_scope :user do
    post '/users/guest_sign_in' => 'users/sessions#new_guest'
    get  '/users/sign_out'      => 'devise/sessions#destroy'
  end
  
  resources :users, only: [:show]
  resources :recruits do
    get  'apply_form' => 'messages#apply_form'
    post 'confirm'    => 'messages#confirm'
    post 'done'       => 'messages#done'
    resource  :likes,   only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
    collection do
      get :search
    end
  end
end
