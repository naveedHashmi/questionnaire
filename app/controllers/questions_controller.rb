class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.js
      else
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.js
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :question_type, :questionnaire_id, options_attributes: [:id, :title, :points, :_destroy])
  end
end
