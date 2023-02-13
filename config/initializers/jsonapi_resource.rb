JSONAPI.configure do |config|
  config.resource_cache = Rails.cache

  config.default_paginator = :paged

  config.default_page_size = 50
  config.maximum_page_size = 100
end
