class CreateCovids < ActiveRecord::Migration[6.0]
  def change
    create_table :covids do |t|
      t.integer :id
      t.datetime :date
      t.integer :cases
      t.integer :deaths
      t.string :name_fr
      t.string :name_en
    end
  end
end
