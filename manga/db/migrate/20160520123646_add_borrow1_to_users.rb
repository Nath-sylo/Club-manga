class AddBorrow1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :borrow1, :string, default: ""
    add_column :users, :borrow2, :string, default: ""
    add_column :users, :borrow3, :string, default: ""
  end
end
