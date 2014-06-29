require 'compass'
require 'susy'
require 'animation'
require 'slim'

activate :livereload
activate :dotenv

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Example for setting up custom page URLs
# %w(work company products contact).each do |url|
#   page "/#{ url }", proxy: "/#{ url }.html"
# end


# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :fjords do |fjords|
  fjords.username = ENV['FJORDS_USERNAME']
  fjords.password = ENV['FJORDS_PASSWORD']
end

# Since we're using bucket names with dots in them, they fail SSL cert
# verification. This forces Fog to use path style URLs
# (s3.amazonaws.com/onbluedot.com) for buckets.
Fog.credentials = { path_style: true }

activate :sync do |sync|
  sync.fog_provider = 'AWS'
  sync.fog_directory = ENV['DEPLOY_BUCKET']
  sync.fog_region = 'us-west-2'
  sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  sync.existing_remote_files = 'keep'
  sync.gzip_compression = true
  sync.after_build = false
end
