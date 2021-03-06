ActionMailer::Base.smtp_settings = {
  :address => 'smtp.postmarkapp.com',
  :port => 587,
  :domain => 'your_domain.com',
  :user_name => ENV['POSTMARK_USERNAME'],
  :password => ENV['POSTMARK_PASSWORD'],
  :authentication => :plain,
  :enable_starttls_auto => true
}
