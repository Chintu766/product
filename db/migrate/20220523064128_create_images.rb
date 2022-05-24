# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :picture
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
