require 'compass'
require 'susy'
require 'animation'
require 'slim'

activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Example for setting up custom page URLs
# %w(work company products contact).each do |url|
#   page "/#{ url }", proxy: "/#{ url }.html"
# end


###
# Helpers
###

helpers do
  # Holder.js image placeholder helper
  def image_placeholder_tag(opts = {})
    return "Missing Image Dimension(s)" unless opts[:width] && opts[:height]
    return "Invalid Image Dimension(s)" unless opts[:width].to_s =~ /^\d+$/ && opts[:height].to_s =~ /^\d+$/

    img  = "<img data-src=\"holder.js/#{opts[:width]}x#{opts[:height]}/auto"
    img << "/#{opts[:bgcolor]}:#{opts[:fgcolor]}" if opts[:fgcolor] && opts[:bgcolor]
    img << "/text:#{opts[:text].gsub(/'/,"\'")}" if opts[:text]
    img << "\" width=\"#{opts[:width]}\" height=\"#{opts[:height]}\">"

    img
  end

end


# Build-specific configuration
configure :build do
  # activate :minify_css
  activate :minify_javascript
end
