require 'api/project'
require 'api/api'

TestGem::Application.routes.draw do

  #加载api
  mount Project::Api => '/'
  mount Api::Api => '/'

  get "applications/index"

  get "applications/create"

  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  root :to => 'homes#index'
  devise_for :users ,:controllers => {:sessions => :sessions,
                                      :registrations => :registrations
  }
  resources :homes

  resources :users do
    get :autocomplete_user_name, :on => :collection
    post :get_arr,:on => :collection
  end

  scope 'admin' do
    resources :homes
  end


  resource :user, :only => [:new]
end
