Rails.application.routes.draw do
  root   'static_pages#home'
  get    'static_pages/about' => 'static_pages#about'
  get    '/terms_of_service' => 'static_pages#terms_of_service'
  get    '/privacy_policy' => 'static_pages#privacy_policy'
end
