Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contribution_notifications, only: [:create]
  root :to => 'donation#index'

  match '/donation'        => 'donation#index', :via => [:get, :post]
  get 'donation/checkout'
  match 'donation/share/:udid' => 'donation#share', :via => :get
  match '/donation/prefill' => 'donation#prefill', :via => [:get, :post]
end
