class AddDefaultToImage < ActiveRecord::Migration[5.0]
  def change
     change_column :users, :image, :string, :default => "https://pics.prcm.jp/299bcdd823d09/53260252/jpeg/53260252.jpeg"
  end
end
