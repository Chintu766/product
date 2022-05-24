# frozen_string_literal: true

class User < ApplicationRecord
  has_many :likes
  has_many :articles, through: :likes
  has_one :favourite
  has_one :share
  before_save :downcase_mail

  def downcase_mail
    self.mail = mail.downcase
    mail
  end
  validates :role, inclusion: { in: %w[admin guest] }
  validates :mail, uniqueness: { case_sensitive: false }, presence: true,
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
end
