class UsersController < ApplicationController
  before_action :authenticate_user!

  def fill_questionnaire
    @questionnaire = Questionnaire.first
  end

  def submit_answers
    current_user.recalculate_score(params.permit!)
  end
end
