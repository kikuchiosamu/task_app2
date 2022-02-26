class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.date :start
      t.date :end
      t.boolean :allday
      t.text :memo

      t.timestamps
    end
  end
end
