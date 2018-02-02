# frozen_string_literal: true

class User < ApplicationRecord
  # TODO: Take a look at https://github.com/thoughtbot/clearance/blob/master/lib/clearance/user.rb.
  include Clearance::User
end
