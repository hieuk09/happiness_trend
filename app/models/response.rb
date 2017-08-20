class Response < ApplicationRecord
  ANSWER_MAPPING = {
    1 => 'Sad',
    2 => 'Normal',
    3 => 'Happy'
  }

  belongs_to :question
  validates :answer, :question, presence: true

  def answer_in_text
    ANSWER_MAPPING[answer]
  end
end
