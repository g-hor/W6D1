# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    
  User.destroy_all
  Poll.destroy_all
  Question.destroy_all
  AnswerChoice.destroy_all
  Response.destroy_all


  %w(users polls questions answer_choices responses).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  # users
  u1 = User.create!(username: 'Zahin')
  u2 = User.create!(username: 'Gary')
  u3 = User.create!(username: 'Alvin')


  # polls
  p1 = Poll.create!(author: u1, title: 'Love')
  p2 = Poll.create!(author: u2, title: 'Food')
  p3 = Poll.create!(author: u3, title: 'Tech')


  
  # p1 questions
  p1_q1 = Question.create!(body: 'What is love?', poll: p1)
  p1_q2 = Question.create!(body: 'How long should you know someone before dating?', poll: p1)

  # p2 questions
  p2_q1 = Question.create!(body: 'Cake or pie?', poll: p2)
  p2_q2 = Question.create!(body: 'Muy caliente?', poll: p2)

  # p3 questions
  p3_q1 = Question.create!(body: 'Mac or PC?', poll: p3)



  # p1 answers
  a1_p1_q1 = AnswerChoice.create!(body: 'Baby dont hurt me', question: p1_q1)
  a2_p1_q1 = AnswerChoice.create!(body: 'The best feeling ever', question: p1_q1)
  a3_p1_q1 = AnswerChoice.create!(body: 'A bunch of lies', question: p1_q1)

  a1_p1_q2 = AnswerChoice.create!(body: 'Doesnt matter', question: p1_q2)
  a2_p1_q2 = AnswerChoice.create!(body: 'Minimum of 1 month', question: p1_q2)
  a3_p1_q2 = AnswerChoice.create!(body: 'Minimum of 3 years', question: p1_q2)
  a4_p1_q2 = AnswerChoice.create!(body: 'NEVER date anybody EVER', question: p1_q2)

  # p2 answers
  a1_p2_q1 = AnswerChoice.create!(body: 'Cake', question: p2_q1)
  a2_p2_q1 = AnswerChoice.create!(body: 'Pie', question: p2_q1)

  a1_p2_q2 = AnswerChoice.create!(body: 'pls no', question: p2_q2)
  a2_p2_q2 = AnswerChoice.create!(body: 'pls yes', question: p2_q2)
  a3_p2_q2 = AnswerChoice.create!(body: 'HECK YA', question: p2_q2)

  # p3 answers
  a1_p3_q1 = AnswerChoice.create!(body: 'Mac', question: p3_q1)
  a2_p3_q1 = AnswerChoice.create!(body: 'PC', question: p3_q1)
  a3_p3_q1 = AnswerChoice.create!(body: '42', question: p3_q1)



  # u1 responses
  r1 = Response.create!(respondent: u1, answer_choice_id: a1_p1_q1.id)
  r2 = Response.create!(respondent: u1, answer_choice_id: a1_p2_q1.id)
  r2 = Response.create!(respondent: u1, answer_choice_id: a1_p3_q1.id)


  # u2 responses
  r4 = Response.create!(respondent: u2, answer_choice_id: a1_p1_q1.id)
  r5 = Response.create!(respondent: u2, answer_choice_id: a2_p2_q1.id)
  r6 = Response.create!(respondent: u2, answer_choice_id: a1_p3_q1.id)
  r10 = Response.create!(respondent: u1, answer_choice_id: a4_p1_q2.id)
  r11 = Response.create!(respondent: u1, answer_choice_id: a2_p2_q2.id)
  r12 = Response.create!(respondent: u1, answer_choice_id: a3_p3_q1.id)


  # u3 responses
  r7 = Response.create!(respondent: u3, answer_choice_id: a3_p1_q1.id)
  r8 = Response.create!(respondent: u3, answer_choice_id: a1_p2_q1.id)
  r9 = Response.create!(respondent: u3, answer_choice_id: a3_p3_q1.id)
  

end