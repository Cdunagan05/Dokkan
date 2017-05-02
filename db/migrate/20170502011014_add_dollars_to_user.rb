class AddDollarsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dollars, :integer, default: 200
  end
end
