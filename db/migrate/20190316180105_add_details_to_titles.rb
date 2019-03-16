class AddDetailsToTitles < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :link, :string
  end
end
