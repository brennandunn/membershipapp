Membershipapp::Application.routes.draw do
  ActiveAdmin.routes(self)
  use_doorkeeper

  mount StripeEvent::Engine => '/stripe'
  get '/api/v1/me.json' => 'users#auth'

  authenticated :user do
    root :to => 'course_modules#index'
  end

  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
  resources :course_modules do
    resources :lessons
  end
  resource :resource

  root :to => "home#index"
end