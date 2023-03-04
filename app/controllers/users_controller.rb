class UsersController < ApplicationController
  before_action :authenticate_user!

  def fill_questionnaire
    @questionnaire = Questionnaire.first
  end

  def submit_answers
  end
end
