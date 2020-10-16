class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.integer :rank
      t.string :itemName
      t.integer :itemPrice
      t.decimal :reviewAverage
      t.string :mediumImageUrls
      t.text :itemCaption
      t.string :itemUrl
      t.string :genre

      t.timestamps
    end
  end
end
