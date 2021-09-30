class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.string :firstname
      t.string :lastname
      t.string :address

      t.timestamps
    end
  end
end
