class CreateTrainingLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :training_logs do |t|
      t.integer :user_id
      t.integer :training_id

      t.timestamps
    end
  end
end
