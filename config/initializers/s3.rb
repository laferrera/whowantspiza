s3config = Rails.configuration.s3
S3 = AWS::S3.new(:access_key_id => s3config[:key], :secret_access_key => s3config[:secret])