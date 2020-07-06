class CreateBeverages < ActiveRecord::Migration[6.0]
  def change
    create_table :beverages do |t|
      t.string :name
      t.integer :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
