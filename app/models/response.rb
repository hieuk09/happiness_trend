class Response < ApplicationRecord
  belongs_to :question

  validates :answer, :question, presence: true
end
