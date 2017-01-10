class ChangeNameFieldPayer < ActiveRecord::Migration[5.0]
  def change 
    remove_column :bills, :payer_id
    add_reference :bills, :user, index: true, foreign_key: true
  end
end
