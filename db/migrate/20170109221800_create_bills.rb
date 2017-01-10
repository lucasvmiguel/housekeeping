class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :payer_id
      t.date :when_payed
      t.decimal :amount

      t.timestamps
    end
  end
end
