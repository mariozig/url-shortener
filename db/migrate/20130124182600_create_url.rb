class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url, :limit => 1024
      t.string :short_url
      t.string :tag
      t.integer :user_id
      t.timestamps
    end
  end
end
