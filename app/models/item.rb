class Item < ActiveRecord::Base
  RECENT = 20

  belongs_to :channel, touch: true
  scope :recent, -> { order('"published_at" DESC').limit(RECENT) }

  attr_accessible :channel, :channel_id, :description, :published_at, :title, :content
  mount_uploader :content, ItemUploader

  validates_presence_of :content

  before_save do
    if content?
      self.title = File.basename(content.path) if title.blank?
    end
    self.published_at ||= Time.now
  end

  def to_s
    title
  end
end
