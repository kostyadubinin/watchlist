# frozen_string_literal: true

Clearance.configure do |config|
  # TODO: Change mailer_sender.
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end
