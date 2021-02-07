Rails.application.routes.draw do
  get 'users/new'
  root   'static_pages#home'
  get    '/about' => 'static_pages#about'
  get    '/terms_of_service' => 'static_pages#terms_of_service'
  get    '/privacy_policy' => 'static_pages#privacy_policy'
  get    '/contact' => 'static_pages#contact'
  get    '/signup' => 'users#new'
end
