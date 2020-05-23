# frozen_string_literal: true

class User::PasswordsController < Devise::PasswordsController
  include Accessible
end
