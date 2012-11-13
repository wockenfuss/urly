class CreateUrlsTable < ActiveRecord::Migration 
  def change
    create_table :urls do |t|
      t.string :original
      t.string :short
      t.integer :view_count, :default => 0
      t.belongs_to :user

      t.timestamps
    end
  end
end