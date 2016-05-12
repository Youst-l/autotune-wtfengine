###
# Autotune
###
activate :directory_indexes

set :layout, 'default'
set :vertical, data.autotune.theme

set :twitter, ''
set :twitter_user_id, ''
set :facebook_app_id, ''
set :site_name, ''

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

data.autotune.available_themes.each do |theme|
  proxy "/themes/#{theme}.css",
        '/theme/themed-styles.css',
        locals: { theme_name: theme,
                  vertical: data.autotune.theme_data[theme].group_slug },
        ignore: true
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets
  set :http_prefix, data.autotune.base_url if data.autotune.base_url
end
