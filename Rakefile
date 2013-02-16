# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'mctv-network'
  app.entitlements['get-task-allow'] = true   # to support Instruments

  app.pods do
    pod 'AFNetworking'
  end
end
