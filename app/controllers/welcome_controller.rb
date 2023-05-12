# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :set_user

  def index; end

  private

  def set_user = @user = current_user
end
