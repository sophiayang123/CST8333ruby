#This class is for generate db table that has all the same column with the csv datasource file
# Program by ShutingYang
class CreateCovids < ActiveRecord::Migration[6.0]
  def change
    create_table :covids do |t|
      # t.integer :id
      t.string :cid
      t.datetime :date
      t.integer :cases
      t.integer :deaths
      t.string :name_fr
      t.string :name_en

      t.timestamps
    end
  end
end
