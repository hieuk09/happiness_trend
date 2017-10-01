require 'rails_helper'
require 'rake'

describe 'migrate_response:execute' do
  let(:rake) { Rake::Task }
  let(:task_name) { 'migrate_response:execute' }
  let!(:response) { create(:response, answer: 1) }

  before do
    Rails.application.load_tasks
  end

  it 'updates data' do
    expect {
      rake[task_name].execute
    }.to change { response.reload.answer }.from(1).to(0)
  end
end
