class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :description
      t.date :due_date

      t.timestamps
    end
  end
end
