class UsersController < ApplicationController
  before_action :authenticate_user!

  def fill_questionnaire
    @questionnaire = Questionnaire.first
  end

  def submit_answers
    redirect_to root_path
  end
end