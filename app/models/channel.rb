class Channel < ActiveRecord::Base
  attr_accessible :description, :image, :title
  has_many :items

  mount_uploader :image, ImageUploader

  def to_s
    title
  end
end
