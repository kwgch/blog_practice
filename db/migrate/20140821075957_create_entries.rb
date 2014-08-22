class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :blog, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
