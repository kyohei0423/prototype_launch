require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module PrototypeLaunch
  class Application < Rails::Application
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| %Q(#{html_tag}).html_safe }
    config.i18n.default_locale = :ja
    config.active_record.raise_in_transactional_callbacks = true
  end
end
