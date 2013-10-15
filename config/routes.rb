Membershipapp::Application.routes.draw do
  use_doorkeeper

  mount StripeEvent::Engine => '/stripe'
  get '/api/v1/me.json' => 'users#auth'

  authenticated :user do
    if ENV['FG']
      root to: redirect(ENV['DISCOURSE'])
    else
      root :to => 'course_modules#index'
    end
  end

  devise_for :users, :controllers => { :registrations => 'registrations', :passwords => 'passwords' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
  resources :course_modules do
    resources :lessons
  end
  resource :resource

  get 'invitation/:cohort', to: 'users#new'

  root :to => redirect('/users/sign_in')

  ActiveAdmin.routes(self)

end