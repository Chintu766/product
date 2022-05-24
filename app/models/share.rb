# frozen_string_literal: true

class Share < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :articles
end
