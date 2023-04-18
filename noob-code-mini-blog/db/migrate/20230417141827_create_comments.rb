class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :post, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
