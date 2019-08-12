class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.text :description, default: ""
      t.decimal :amount, null: false
      t.references :category, foreign_key: true
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
