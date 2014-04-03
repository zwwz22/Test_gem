require 'api/project_helper'
module Project
  class Api < Grape::API
    version 'v1',  using:  :path
    format :json
    helpers ApiHelper
    helpers do
      def get_bb
        3333
      end
    end

    rescue_from :all do |e|
      Rack::Response.new([ e.message ], 500, { "Content-type" => "application/json" }).finish
    end

    #mount Restfuls::Aa
    #mount Restfuls::Bb

    params {requires :a, :type => String}
    get '/test(.:format)' do
      data = {:a => params[:a]}
      {:code => 200}.merge!(data).to_json
    end

    #params {requires :b, :type => String}
    get '/aa' do
      {:s => User.all,:b =>get_na,:c => get_bb}
    end

    namespace :bb do
      get '/cc' do
        {'a' => 'dasdasdasdas'}
      end
    end
  end
end
