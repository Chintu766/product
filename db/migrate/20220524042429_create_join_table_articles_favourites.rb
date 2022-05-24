# frozen_string_literal: true

class CreateJoinTableArticlesFavourites < ActiveRecord::Migration[6.1]
  def change
    create_join_table :articles, :favourites
  end
end
