# frozen_string_literal: true
# name: discourse-plugin-messages-broadcaster
# about: A plugin to send private messages using a simple form
# version: 0.1.0
# authors: Xavier Garzon
# url: https://github.com/getit039/discourse-plugin-messages-broadcaster

enabled_site_setting :message_plugin_enabled

register_asset "stylesheets/message-form.scss"

after_initialize do
  load File.expand_path("../config/routes.rb", __FILE__)
end
