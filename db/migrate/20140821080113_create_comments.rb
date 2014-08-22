class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :entry, index: true
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
