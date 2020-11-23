class AddColumLimit < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :limit, :date
  end
end
