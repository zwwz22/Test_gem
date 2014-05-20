
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.sina.com",
    :port                 => 25,
    :domain               => 'sina.com',
    :user_name            => '***',
    :password             => '***',
    :authentication       => :login
    #:enable_starttls_auto => true
}