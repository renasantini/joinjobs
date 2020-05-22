# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  include Accessible
end
