require 'api/project'
require 'api/api'

TestGem::Application.routes.draw do

  #加载api
  mount Project::Api => '/'
  mount Api::Api => '/'

  root :to => 'homes#index'

  resources :homes

  resource :article



  namespace 'rou' do
    devise_for :users ,:controllers => {:sessions => :sessions,
                                        :registrations => :registrations
    }

    root :to => 'homes#index'
    resources :homes

    resources :users do
      post :get_arr,:on => :collection
    end

    resources :articles

    resources :categories
  end
end
