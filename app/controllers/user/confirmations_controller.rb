# frozen_string_literal: true

class User::ConfirmationsController < Devise::ConfirmationsController
  include Accessible
end
