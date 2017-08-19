class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.references :question
      t.integer :answer
      t.text :detail

      t.timestamps
    end
  end
end
