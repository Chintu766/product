# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 30 }
  has_one :image
  has_and_belongs_to_many :favourites
  has_and_belongs_to_many :shares

  def self.title_matches(param)
    matches('title', param)
  end

  def self.search(param)
    param.strip!
    match_results = title_matches(param).uniq
    return nil if match_results.empty?

    match_results
  end

  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end
end
