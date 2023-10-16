# frozen_string_literal: true

class TranslateController < ApplicationController
  wrap_parameters format: :json
  before_action :set_user

  def translate
    target_language = @user.translation_language
    return render json: { message: translate_params[:message] } if target_language == translate_params[:message]

    render json: { message: Messages::Translator.call(translate_params[:message], target_language) }
  end

  private

  def translate_params = params.permit(:message, :source_language)

  def set_user = @user = current_user
end
