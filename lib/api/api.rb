module Api
  class Api < Grape::API
    version 'v2',  using:  :path
    format :json
    #helpers ApiHelper
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

    params {requires :b, :type => String}
    get '/bb' do
      {:s => User.first,:b => params[:b]}
    end
  end
end
