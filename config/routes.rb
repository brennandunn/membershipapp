Membershipapp::Application.routes.draw do
  use_doorkeeper

  mount StripeEvent::Engine => '/stripe'
  get '/api/v1/me.json' => 'users#auth'

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
  resources :course_modules
  resource :resource
end