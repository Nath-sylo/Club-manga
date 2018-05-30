
class CreateOuvrages < ActiveRecord::Migration
  def change
    create_table :ouvrages do |t|
      t.string :title
      t.text :synopsis
      t.integer :begin
      t.integer :final
      t.string :missing_tome
      t.integer :complete
      t.string :author
      t.string :editor
      t.integer :release_date
      t.text :genre
      t.string :cover

      t.timestamps null: false
    end
end
end
