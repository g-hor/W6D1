# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text
#  poll_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice,
    dependent: :destroy

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses
end
