FollowThru::Application.routes.draw do

  # Logged in
  authenticated :user do
    
    # Basic site layout!
    root :to => 'home#index'
    match "/about" => "home#about", :as => :home_about
    match "/new" => "home#create_project", :as => :home_new
    match "/manage" => "home#manage_project", :as => :home_manage
    match "/all" => "home#index", :as => :home_all

    # Dynamic ajax actions
    resources :goals, :path => "ajax/goals"
    resources :pledges, :path => "ajax/pledges"
    resources :pledge_types, :path => "ajax/pledge_types"
    resources :projects, :path => "ajax/projects"
  end

  # Not logged in? All you can see the homepage.
  root :to => "home#index"

  # Auth control
  devise_for :users
  resources :users, :only => [:show, :index]
end
