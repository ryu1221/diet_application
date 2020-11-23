class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :tasks
      t.string :content
      t.integer :completed

      t.timestamps
    end
  end
end
