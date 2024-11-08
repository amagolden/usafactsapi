class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :cost
      t.integer :year

      t.timestamps
    end
  end
end
