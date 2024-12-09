class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
