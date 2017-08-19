class Question < ApplicationRecord
  def self.default_question
    find_or_create_by(prompt: 'Are you happy today?')
  end
end
