class Poll::Question::Answer < ApplicationRecord
  include Galleryable
  include Documentable

  translates :title,       touch: true
  translates :description, touch: true
  include Globalizable

  accepts_nested_attributes_for :documents, allow_destroy: true

  belongs_to :question, class_name: "Poll::Question"
  has_many :videos, class_name: "Poll::Question::Answer::Video", dependent: :destroy

  validates_translation :title, presence: true
  validates :given_order, presence: true, uniqueness: { scope: :question_id }

  def self.order_answers(ordered_array)
    ordered_array.each_with_index do |answer_id, order|
      find(answer_id).update_column(:given_order, (order + 1))
    end
  end

  def self.last_position(question_id)
    where(question_id: question_id).maximum("given_order") || 0
  end

  def total_votes
    result = 0
    locales = available_locales
    titles = locales.map { |lang| self.send("title_#{lang}") }
    result = Poll::Answer.where(question_id: question, answer: titles).count + ::Poll::PartialResult.where(question: question).where(answer: titles).sum(:amount)
    result
  end

  def total_votes_percentage
    question.answers_total_votes.zero? ? 0 : (total_votes * 100.0) / question.answers_total_votes
  end
end
