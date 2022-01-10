class Polls::QuestionsController < ApplicationController
  include PollsHelper

  load_and_authorize_resource :poll, class: "Poll"
  load_and_authorize_resource :question, class: "Poll::Question"

  has_orders %w[most_voted newest oldest], only: :show

  def answer
    if voted_before_sign_in(@question)
      @question.answers.where(author: current_user).destroy_all
    end
    answers = @question.answers.where(author: current_user)
    max_answers = 1
    if @question.poll.method == 'multiple'
      max_answers = @question.poll.max_answers
    end
    answers_available = max_answers - answers.count
    if answers_available < 1
      answer = answers.order(:updated_at => 'asc').first
      token = params[:token]

      answer.answer = params[:answer]
      answer.save_and_record_voter_participation(token)
    else
      answer = @question.answers.new(author: current_user)
      token = params[:token]

      answer.answer = params[:answer]
      answer.save_and_record_voter_participation(token)
    end
    answers_array = Array.new()
    @answers_by_question_id = { @question.id => answers_array }
    new_answers = @question.answers.where(author: current_user)
    new_answers.each do |answer|
      @answers_by_question_id = { @question.id => answers_array.append(answer.answer) }
    end
  end
end
