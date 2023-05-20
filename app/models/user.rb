class User < ApplicationRecord
  attr_accessor :wizard, :witch, :leprechaun, :dragon, :human, :elf, :fairy, :params
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, user: 1 }

  # instance methods
  def recalculate_score(params)
    initialize_attributes(params)

    range_answers = params['range_options'][0] || []
    picture_options = params['picture_options']
    single_choice_options = params['single_choice']
    multi_choice_options = params['multi_choice']

    add_score(Option.where(id: single_choice_options.to_a + multi_choice_options.to_a), nil)
    add_score(PictureOption.where(id: picture_options), nil)
    add_score(RangeOption.where(id: range_answers.map(&:first).map{ |option| option.split('_').last } ), 'range')

    calcualte_percentage
  end

  private

  def initialize_attributes(params)
    @wizard, @witch, @leprechaun, @dragon, @human, @elf, @fairy, @range_options = 0, 0, 0, 0, 0, 0, 0, params['range_options'][0]&.to_h || []
  end

  def add_score(options, question_type)
    return unless options.present?

    if question_type == 'range'
      options.each do |option|
        @wizard += @range_options["option_#{option.id}"].to_f * option.wizard_percentage
        @witch += @range_options["option_#{option.id}"].to_f * option.witch_percentage
        @leprechaun += @range_options["option_#{option.id}"].to_f * option.leprechaun_percentage
        @dragon += @range_options["option_#{option.id}"].to_f * option.dragon_percentage
        @human += @range_options["option_#{option.id}"].to_f * option.human_percentage
        @elf += @range_options["option_#{option.id}"].to_f * option.elf_percentage
        @fairy += @range_options["option_#{option.id}"].to_f * option.fairy_percentage
      end
    else
      @wizard += options.sum(:wizard_points).to_f
      @witch += options.sum(:witch_points).to_f
      @leprechaun += options.sum(:leprechaun_points).to_f
      @dragon += options.sum(:dragon_points).to_f
      @human += options.sum(:human_points).to_f
      @elf += options.sum(:elf_points).to_f
      @fairy += options.sum(:fairy_points).to_f
    end
  end

  def calcualte_percentage
    total_score = @wizard + @witch + @leprechaun + @dragon + @human + @elf + @fairy
    total_score = total_score.zero? ? 1 : total_score
    @wizard = (@wizard / total_score) * 100
    @witch = (@witch / total_score) * 100
    @leprechaun = (@leprechaun / total_score) * 100
    @dragon = (@dragon / total_score) * 100
    @human = (@human / total_score) * 100
    @elf = (@elf / total_score) * 100
    @fairy = (@fairy / total_score) * 100
  end
end
