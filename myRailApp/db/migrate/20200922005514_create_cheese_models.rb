class CreateCheeseModels < ActiveRecord::Migration[6.0]
  def change
    create_table :cheese_models do |t|
      t.integer   "id"
      t.datetime  "date"
      t.integer  "cases"
      t.integer  "deaths"
      t.decimal  "cases_14_100k"
      t.decimal  "cases_100k",         
      t.string  "name_fr",        
      t.string  "name_en"
    end
  end
end
