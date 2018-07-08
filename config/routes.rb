Rails.application.routes.draw do
  root :to => 'home#index'
  # post '/webhooks/order_create' => 'custom_webhooks#order_create'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
