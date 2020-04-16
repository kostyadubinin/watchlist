# frozen_string_literal: true

# TODO: Learn how the confirmation_token and the remember_token fields work.
class User < ApplicationRecord
  # TODO: Take a look at https://github.com/thoughtbot/clearance/blob/master/lib/clearance/user.rb.
  include Clearance::User
end
