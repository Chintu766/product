# frozen_string_literal: true

class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
