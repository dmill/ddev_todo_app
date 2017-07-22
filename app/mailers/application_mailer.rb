class ApplicationMailer < ActionMailer::Base
  default from: 'rando@thing.com'
  layout 'mailer'
end
