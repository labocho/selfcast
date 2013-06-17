require "aws-sdk"
class Item < ActiveRecord::Base
  RECENT = 20

  belongs_to :channel, touch: true
  scope :recent, -> { order('"published_at" DESC').limit(RECENT) }

  attr_accessible :channel, :channel_id, :description, :published_at, :title, :content_filename
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

  def content_filename=(v)
    self[:content] = v
  end

  def as_json(options = {})
    post = presigned_post
    attributes.merge(
      presigned_post: {
        url: post.url.to_s,
        fields: post.fields
      }
    )
  end

  def presigned_post
    s3 = AWS::S3.new(
      access_key_id: content.fog_credentials[:aws_access_key_id],
      secret_access_key: content.fog_credentials[:aws_secret_access_key]
    )
    bucket = s3.buckets[content.fog_directory]
    bucket.presigned_post(key: content.path)
  end
end
