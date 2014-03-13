require 'openssl'
require 'httparty'
class Meme
  def test
    str =   {"xml"=>
                 {
                     "ToUserName"=>"gh_439ebcfb4df5",
                     "FromUserName"=>"ouOxsuOQ6wu7gNrjIoKLLp0PMQgo",
                     "CreateTime"=>"1388997697", "MsgType"=>"image",
                     "PicUrl"=>"http://mmbiz.qpic.cn/mmbiz/mcWs0XwOiauwPDX1kddib92QbbAs4YHNFDgcHicnV0v1K2UgT1Bn5AcOnviabKHSlr6Eb6icmKbcPNM4ZzFvibhTrIXA/0",
                     "MsgId"=>"5965668295223324543",
                     "MediaId"=>"l4GAQLiWTVm29VfyN_OSUoj213h8_0homvke7_kyZ1k"
                 },
             "signature"=>"daa4bc258f8eed8d10e42b5dc0539e57c5985e2a",
             "timestamp"=>"1388990391",
             "nonce"=>"1389075714"}
    responds = get_responds str['xml'],'api_key','api_secret'

    p responds.body
  end
  private
  def get_responds(xml,api_key,api_secret)
    signature = build_signature xml,api_key,api_secret
    p signature.length
    options = {
        :body => {
            :open_id   => xml['FromUserName'],
            :image_url => xml['PicUrl'],
            :timestamp => xml['CreateTime'],
            :api_key   => api_key,
            :signature => signature
        }
    }
    responds = HTTParty.post('http://fp.memeing.cn/api/v1/postcards/create_wechat_url',options)
  end

  def build_signature(xml,api_key,api_secret)
    path = build_path xml,api_key
    signature = OpenSSL::HMAC.hexdigest('sha1',api_secret,path)
  end

  def build_path(xml,api_key)
    h = Hash.new
    h[:open_id]   = xml['FromUserName']
    h[:image_url] = xml['PicUrl']
    h[:timestamp] = xml['CreateTime']
    h[:api_key]   = api_key
    h = Hash[h.sort]
    path = Array.new
    h.map do |k,v|
      path << "#{k}=#{v}"
    end
    path.join('&')
  end
end

Meme.new.test
