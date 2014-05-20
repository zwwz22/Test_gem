class UserMailer < ActionMailer::Base
  default from: "zwwz22@sina.com"

  def welcome_email
    mail(:to => '137671131@qq.com', :subject => "神秘网站") do |format|
      format.text{render :text => '地址是 www.sqqe550.com 根本停不下来'}
    end
  end
end
