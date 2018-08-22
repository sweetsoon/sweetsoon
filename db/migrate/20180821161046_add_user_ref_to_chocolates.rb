class AddUserRefToChocolates < ActiveRecord::Migration[5.2]
  def change
    add_reference :chocolates, :user, foreign_key: true
  end
end
