class Channel < ActiveRecord::Base
  attr_accessible :description, :image, :title
  has_many :items

  def to_s
    title
  end
end
