require "aws-sdk"
class Item < ApplicationRecord
  RECENT = 100

  belongs_to :channel, touch: true
  scope :recent, -> { order('"published_at" DESC').limit(RECENT) }

  # attr_accessible :channel, :channel_id, :description, :published_at, :title, :content_filename
  mount_uploader :content, ItemUploader

  validates_presence_of :content

  before_save do
    if content?
      self.title = File.basename(content.path) if title.blank?
    end
    self.published_at ||= Time.now
  end

  def self.order_by_published_at_desc
    order("published_at DESC")
  end

  def to_s
    title
  end

  def content_filename=(v)
    self[:content] = v
  end

  def as_json(options = {})
    url = presigned_url
    attributes.merge(
      presigned_url: url.to_s
    )
  end

  def subtitle
    return unless description
    description.lines.to_a[0..1].map(&:strip).join(" ").strip
  end

  def summary
    description
  end

  def presigned_url
    s3 = Aws::S3::Resource.new(
      region: content.fog_credentials[:region],
      access_key_id: content.fog_credentials[:aws_access_key_id],
      secret_access_key: content.fog_credentials[:aws_secret_access_key]
    )
    obj = s3.bucket(content.fog_directory).object("#{content.store_dir}/#{self[:content]}")
    obj.presigned_url(:put)
  end
end
