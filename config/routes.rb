require 'api/project'
require 'api/api'

TestGem::Application.routes.draw do

  #加载api
  mount Project::Api => '/'
  mount Api::Api => '/'

  root :to => 'homes#index'

  resources :homes

  resources :articles


  namespace 'rou' do
    devise_for :users ,:controllers => {:sessions => :sessions,
                                        :registrations => :registrations
    }

    root :to => 'articles#index'
    resources :homes

    resources :users do
      post :get_arr,:on => :collection
      get :login, :on => :collection
      post :login, :on => :collection
      get :log_out, :on => :collection
    end

    resources :articles

    resources :categories
  end
end
