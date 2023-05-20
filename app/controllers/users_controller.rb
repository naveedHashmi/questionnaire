class UsersController < ApplicationController
  before_action :authenticate_user!

  def fill_questionnaire
    @questionnaire = Questionnaire.includes(:questions).order(:updated_at).last
    @questions = @questionnaire.questions.includes(:picture_options, :range_options, :options).map do |question|
      question.as_json.merge(range_options: question.range_options.as_json, options: question.options.as_json, picture_options: question.picture_options.map do |picture_option|
        picture_option.as_json.merge(picture_url: url_for(picture_option.picture))
      end)
    end
  end

  def submit_answers
    current_user.recalculate_score(params.permit!)
  end
end
