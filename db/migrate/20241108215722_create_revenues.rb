class CreateRevenues < ActiveRecord::Migration[8.0]
  def change
    create_table :revenues do |t|
      t.string :name
      t.integer :amount
      t.integer :year

      t.timestamps
    end
  end
end
