# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  include Accessible
end
