CarrierWave.configure do |config|
  config.fog_provider = "fog/aws"
  config.fog_credentials = {
    provider:               "AWS", # required
    aws_access_key_id:      ENV["AWS_ACCESS_KEY"], # required
    aws_secret_access_key:  ENV["AWS_SECRET_ACCESS_KEY"], # required
    region:                 ENV["AWS_REGION"], # optional, defaults to 'us-east-1'
    # host:                   's3.example.com',             # optional, defaults to nil
    # endpoint:               'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV["S3_BUCKET"] # required
  config.fog_public     = true # optional, defaults to true
  config.fog_attributes = {
    "Cache-Control" => "max-age=#{1.week.to_i}",
    "x-amz-storage-class" => "STANDARD_IA",
  }
  config.fog_authenticated_url_expiration = 1.week.to_i
end
