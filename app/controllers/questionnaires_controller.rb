class QuestionnairesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  def index
    @questionnaires = Questionnaire.all
  end

  def show
  end

  def new
    @questionnaire = Questionnaire.new
    @questionnaire.questions.build
  end

  def edit
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def require_admin!
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(
      :title,
      :description,
      questions_attributes: [
        :id,
        :title,
        :question_type,
        :_destroy,
        options_attributes: [
          :id,
          :title,
          :witch_points,
          :wizard_points,
          :lepracaun_points,
          :dragon_points,
          :human_points,
          :elf_points,
          :fairy_points,
          :_destroy,
        ],
        picture_options_attributes: [
          :id,
          :picture,
          :witch_points,
          :wizard_points,
          :lepracaun_points,
          :dragon_points,
          :human_points,
          :elf_points,
          :fairy_points,
          :_destroy,
        ],
        range_options_attributes: [
          :id,
          :min_range,
          :max_range,
          :witch_percentage,
          :wizard_percentage,
          :lepracaun_percentage,
          :dragon_percentage,
          :human_percentage,
          :elf_percentage,
          :fairy_percentage,
          :_destroy,
        ]
      ]
    )
  end
end
