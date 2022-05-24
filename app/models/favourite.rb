# frozen_string_literal: true

class Favourite < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :articles
end
