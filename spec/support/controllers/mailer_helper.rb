module Controllers
  module MailerHelpers
    def last_email
      ActionMailer::Base.deliveries.last
    end
  end
end