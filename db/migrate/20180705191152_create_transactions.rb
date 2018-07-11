class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :to_user, foreign_key: { to_table: :users }, index: true
      t.references :from_user, foreign_key: { to_table: :users }, index: true
      t.string :num_credits, null: false

      t.timestamps
    end
  end
end
