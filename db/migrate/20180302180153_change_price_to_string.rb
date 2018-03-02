class ChangePriceToString < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :int)
    add_column(:brands, :price, :string)
  end
end
