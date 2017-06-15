class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false
      t.string :long_url, null: false, unique: true
      t.string :short_url, null: false, unique: true
      t.timestamps
    end

    add_index :shortened_urls, :user_id
    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :long_url
  end
end
