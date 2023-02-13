# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  body        :text             not null
#  question_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Response,
    dependent: :destroy

    
end
