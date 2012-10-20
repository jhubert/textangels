TextAngel::Application.routes.draw do
  resources :conversations, :only => [ :index, :show ]
  resources :messages, :only => [ :new, :create ]

  get "dashboard" => "dashboard#index", :as => :dashboard

  post "api/voice"
  post "api/sms"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  root :to => 'general#index'
end
