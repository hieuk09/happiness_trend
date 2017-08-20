class AddCreatedAtIndexToResponse < ActiveRecord::Migration[5.0]
  def change
    add_index :responses, :created_at
  end
end
