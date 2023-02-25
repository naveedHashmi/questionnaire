class OptionsController < ApplicationController
  before_action :set_option, only: [:edit, :update, :destroy]

  def create
    @question = Question.find(params[:question_id])
    @option = @question.options.build(option_params)

    if @option.save
      redirect_to @question, notice: 'Option was successfully created.'
    else
      render :new
    end
  end

  def edit
    @question = @option.question
  end

  def update
    if @option.update(option_params)
      redirect_to @option.question, notice: 'Option was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @option.destroy
    redirect_to @option.question, notice: 'Option was successfully destroyed.'
  end

  private

  def set_option
    @option = Option.find(params[:id])
  end

  def option_params
    params.require(:option).permit(:title, :points)
  end
end
