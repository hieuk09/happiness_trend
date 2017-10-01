namespace :migrate_response do
  desc 'Move unhappy response from 1 to 0 for better score evaluation'
  task execute: :environment do
    Response.where(answer: 1).update_all(answer: 0)
  end
end
