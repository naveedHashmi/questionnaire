class User < ApplicationRecord
  attr_accessor :wizard, :witch, :lepracaun, :dragon, :human, :elf, :fairy, :params
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, user: 1 }

  # instance methods
  def recalculate_score(params)
    initialize_attributes(params)

    answers = params[:questionnaire][:questions]
    questions = Question.includes(:options, :range_options, :picture_options).where(id: answers.keys)

    questions.each do |question|

      options = if question.single_choice? || question.multiple_choice?
                  question.options.where(id: answers[question.id.to_s]["selected_option_id"])
                elsif question.picture?
                  question.picture_options.where(id: answers[question.id.to_s]["selected_option_id"])
                else

                  question.range_options.where(id: answers[question.id.to_s]["selected_option_ids"])
                end

      add_score(options, question.question_type)
    end

    calcualte_percentage
  end

  private

  def initialize_attributes(params)
    @wizard, @witch, @lepracaun, @dragon, @human, @elf, @fairy, @params = 0, 0, 0, 0, 0, 0, 0, params
  end

  def add_score(options, question_type)
    if ['single_choice', 'multiple_choice', 'picture'].include? question_type
      @wizard += options.sum(:wizard_points)
      @witch += options.sum(:witch_points)
      @lepracaun += options.sum(:lepracaun_points)
      @dragon += options.sum(:dragon_points)
      @human += options.sum(:human_points)
      @elf += options.sum(:elf_points)
      @fairy += options.sum(:fairy_points)
    else
      options.each do |option|
        @wizard += @params["option_#{option.id}"].to_i * option.wizard_percentage
        @witch += @params["option_#{option.id}"].to_i * option.witch_percentage
        @lepracaun += @params["option_#{option.id}"].to_i * option.lepracaun_percentage
        @dragon += @params["option_#{option.id}"].to_i * option.dragon_percentage
        @human += @params["option_#{option.id}"].to_i * option.human_percentage
        @elf += @params["option_#{option.id}"].to_i * option.elf_percentage
        @fairy += @params["option_#{option.id}"].to_i * option.fairy_percentage
      end
    end
  end

  def calcualte_percentage
    total_score = @wizard + @witch + @lepracaun + @dragon + @human + @elf + @fairy
    @wizard = (@wizard / total_score) * 100
    @witch = (@witch / total_score) * 100
    @lepracaun = (@lepracaun / total_score) * 100
    @dragon = (@dragon / total_score) * 100
    @human = (@human / total_score) * 100
    @elf = (@elf / total_score) * 100
    @fairy = (@fairy / total_score) * 100
  end
end
