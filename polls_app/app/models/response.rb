# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  respondent_id    :bigint           not null
#  answer_choice_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :respondent_id,
    class_name: :User

  belongs_to :chosen_answer,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :chosen_answer,
    source: :question

  def sibling_responses
    self.question.responses
      .where.not('responses.id = ?', self.id)
  end

  def respondent_already_answered?
    self.sibling_responses.any? { |response| response.respondent_id = self.respondent_id}
  end
end
