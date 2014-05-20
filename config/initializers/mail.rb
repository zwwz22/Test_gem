
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.sina.com",
    :port                 => 25,
    :domain               => 'sina.com',
    :user_name            => '***111',
    :password             => '***222',
    :authentication       => :login
    #:enable_starttls_auto => true
}