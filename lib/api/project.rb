require 'api/project_helper'
require 'digest/sha1'
require 'httparty'
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
    #测试微信post 数据
    get '/aa' do
      p 1
      request =   {"xml"=>
                   {
                       "ToUserName"=>"gh_439ebcfb4df5",
                       "FromUserName"=>"ouOxsuOQ6wu7gNrjIoKLLp0PMQgo",
                       "CreateTime"=>"1398044948", "MsgType"=>"image",
                       "PicUrl"=>"http://mmbiz.qpic.cn/mmbiz/EuibFBvAicrDmTkOF4SPBucQyg5pB2VF1fKG321D5koJeOsnupIoCRiaa1g1gDicERSnks5Raju3w1FbJfEmaE41Yg/0",
                       "MsgId"=>"5965668295223324543",
                       "MediaId"=>"l4GAQLiWTVm29VfyN_OSUoj213h8_0homvke7_kyZ1k"
                   },
               "signature"=>"daa4bc258f8eed8d10e42b5dc0539e57c5985e2a",
               "timestamp"=>"1398044948",
               "nonce"=>"1398044948"}

      ss = '<Title><![CDATA[公众平台官网链接]]></Title>
<Description><![CDATA[公众平台官网链接]]></Description>
<Url><![CDATA[url]]></Url>'
      for_sign_array = Array.new
      for_sign_array << '1398842216'
      for_sign_array << '1398842216'
      for_sign_array << '6TeEDG'
      signed = Digest::SHA1.hexdigest(for_sign_array.sort!.join)
      str = "signature=#{signed}&timestamp=#{1398842216}&nonce=#{1398842216}"
      p str
      @xml = Nokogiri::XML::Builder.new do
        xml do
          ToUserName   { cdata('gh_d43310b359d6') }
          FromUserName { cdata('ouOxsuOQ6wu7gNrjIoKLLp0PMQgo') }
          CreateTime   1398842216
          MsgType      { cdata('text')}
          Content      { cdata("时间")}
          #PicUrl       { cdata('http://mmbiz.qpic.cn/mmbiz/EuibFBvAicrDmTkOF4SPBucQyg5pB2VF1fKG321D5koJeOsnupIoCRiaa1g1gDicERSnks5Raju3w1FbJfEmaE41Yg/0')}
          MediaId      {cdata('l4GAQLiWTVm29VfyN_OSUoj213h8_0homvke7_kyZ1k')}
          MsgId        {cdata('5965668295223324543')}
        end
      end

      options = {
          :body =>  @xml.to_xml,
          :headers => {'Content-type' => 'text/xml'}
      }
      responds = HTTParty.post("http://wxapi.v5kf.com/public/weixin?site_id=40685&#{str}",options)
      {:s => User.all,:b =>responds,:c => responds.body}
    end

    get '/d' do
      str = "<?xml version='1.0'?> <xml> <ToUserName><![CDATA[ouOxsuOQ6wu7gNrjIoKLLp0PMQgo]]></ToUserName> <FromUserName><![CDATA[gh_439ebcfb4df5]]></FromUserName> <CreateTime>1398068408</CreateTime> <MsgType><![CDATA[text]]></MsgType> <Content><![CDATA[回复图片即可立即制作并打印一张专属明信片。（点击“＋”号，上传手机照片）]]></Content> </xml>"
       a = Nokogiri::XML(str).xpath('xml')
      {:s => '3333',:b =>a,:c => a.xpath('CreateTime').inner_text}
    end
    namespace :bb do
      get '/cc' do
        {'a' => 'dasdasdasdas'}
      end
    end
  end
end
