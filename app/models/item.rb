class Item < ActiveRecord::Base
  belongs_to :channel
  attr_accessible :channel, :channel_id, :description, :published_at, :title, :content
  mount_uploader :content, ItemUploader

  validates_presence_of :content

  before_save do
    debugger
    if content?
      self.title = File.basename(content.path) if title.blank?
    end
    self.published_at ||= Time.now
  end

  def to_s
    title
  end
end
