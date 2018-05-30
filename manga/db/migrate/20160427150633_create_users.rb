class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :active
      t.integer :current_borrows, default: 0
      t.string :name
      t.string :surname
      t.string :pseudo
      t.string :course
      t.integer :year

      t.timestamps null: false
    end
  end
end
