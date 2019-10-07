class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :name_of_file, :limit => 64
      t.timestamps
    end
  end

  def  dow
    drop_table :users
  end
end
