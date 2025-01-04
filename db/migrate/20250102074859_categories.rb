class Categories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null:true
      
      t.timestamps
    end
  end
end
