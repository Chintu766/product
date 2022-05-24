# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :article
  mount_uploader :picture, PictureUploader
end
