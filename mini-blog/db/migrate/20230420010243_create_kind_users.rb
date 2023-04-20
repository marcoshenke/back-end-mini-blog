class CreateKindUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :kind_users do |t|
      t.string :kind
      t.timestamps
    end
  end
end
