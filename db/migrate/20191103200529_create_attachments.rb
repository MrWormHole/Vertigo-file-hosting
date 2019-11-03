class CreateAttachments < ActiveRecord::Migration[6.0]
  def up
    create_table :attachments do |t|
      t.string :name, :limit => 64
      t.boolean :visible, :default => true
      t.integer :download_count, :default => 0
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :attachments, :visible
  end

  def down
    drop_table :attachments
  end
end
