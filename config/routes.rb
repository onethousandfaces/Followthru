FollowThru::Application.routes.draw do

  # Logged in
  authenticated :user do
    
    # Basic site layout!
    root :to => 'home#index'
    match "/about" => "home#about", :as => :home_about
	  match "/browse" => "home#browse_project", :as => :home_browse
    match "/manage" => "home#manage_project", :as => :home_manage
    match "/all" => "home#index", :as => :home_all
    match "/new" => "home#create_project", :as => :home_new

    # For managing projects, base urls
    match "/project/new" => "project_control#new", :as => :project_new
    match "/project/list" => "project_control#list", :as => :project_list
    match "/project/view" => "project_control#view", :as => :project_view_base
    match "/project/edit" => "project_control#edit", :as => :project_edit_base
    match "/project/delete" => "project_control#delete", :as => :project_delete_base

    # Specific url patterns for editing items, etc.
    match "/project/view/:id" => "project_control#view", :as => :project_view
    match "/project/delete/:id" => "project_control#delete", :as => :project_delete
    match "/project/edit" => "project_control#edit", :as => :project_edit

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
