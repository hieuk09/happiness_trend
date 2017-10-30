class Response < ApplicationRecord
  ANSWER_MAPPING = {
    0 => 'sad',
    2 => 'normal',
    3 => 'happy'
  }
  VALUE_MAPPING = ANSWER_MAPPING.invert

  belongs_to :question
  validates :answer, :question, presence: true

  def answer_in_text
    ANSWER_MAPPING[answer]
  end

  def created_date
    created_at.to_date
  end

  def self.answer_on(date)
    duration = date.beginning_of_day..date.end_of_day
    where(created_at: duration)
  end
end
