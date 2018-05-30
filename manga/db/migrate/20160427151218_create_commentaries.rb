class CreateCommentaries < ActiveRecord::Migration
  def change
    create_table :commentaries do |t|
      t.references :user, index: true, foreign_key: true
      t.references :ouvrage, index: true, foreign_key: true
      t.text :texte
      t.datetime :date
      t.float :note

      t.timestamps null: false
    end
  end
end
