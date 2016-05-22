CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAISAH62TAEPURJCNQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'us-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'buynothing-dev'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end