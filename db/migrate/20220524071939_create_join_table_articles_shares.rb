# frozen_string_literal: true

class CreateJoinTableArticlesShares < ActiveRecord::Migration[6.1]
  def change
    create_join_table :articles, :shares
  end
end
