# frozen_string_literal: true
# name: discourse-message-plugin
# about: A plugin to send private messages using a simple form
# version: 0.1.0
# authors: Xavier Garzon
# url: https://github.com/yourusername/discourse-message-plugin

enabled_site_setting :message_plugin_enabled

register_asset "stylesheets/message-form.scss"

after_initialize do
  load File.expand_path("../config/routes.rb", __FILE__)
end
