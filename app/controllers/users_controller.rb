class UsersController < ApplicationController
  before_action :authenticate_user!

  def fill_questionnaire
    @questionnaire = Questionnaire.order(:updated_at).last
  end

  def submit_answers
    current_user.recalculate_score(params.permit!)
  end
end
