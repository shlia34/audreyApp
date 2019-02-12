class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :date
      t.text :image_url
      t.text :link
      t.timestamps
    end
  end
end
