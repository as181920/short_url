class CreateShortUrlLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :short_url_links do |t|
      t.text :original_url, index: {unique: true}

      t.datetime :created_at, null: false
    end
  end
end
