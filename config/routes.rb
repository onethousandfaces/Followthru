FollowThru::Application.routes.draw do

  # Logged in
  authenticated :user do
    
    # Basic site layout!
    root :to => 'home#index'
    match "/about" => "home#about", :as => :home_about
    match "/new" => "home#create_project", :as => :home_new
    match "/all" => "home#index", :as => :home_all
  end

  # Not logged in? All you can see the homepage.
  root :to => "home#index"

  # Auth control
  devise_for :users
  resources :users, :only => [:show, :index]
end
