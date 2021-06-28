module Consul
  class Application < Rails::Application
    config.i18n.default_locale = :ca
    config.i18n.available_locales = [:es, :ca]
  end
end
