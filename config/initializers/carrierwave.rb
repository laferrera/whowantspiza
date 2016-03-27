CarrierWave.configure do |config|
  s3 = Rails.configuration.s3
  config.fog_credentials = {
    :provider               => 'AWS',            
    :aws_access_key_id      => s3[:key],                 
    :aws_secret_access_key  => s3[:secret],                  
    :region                 => 'eu-west-1',              
    :host                   => s3[:base_url],            
    :endpoint               => s3[:base_url] 
  }
  config.fog_directory  = s3[:watermark_bucket] # Bucket
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {}  # optional, defaults to {}
  # config.asset_host = ENV['CLOUDFRONT_URL']
end