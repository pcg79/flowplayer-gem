module Flowplayer
  require 'rails'
  class Railtie < ::Rails::Railtie
    generators do
      require File.join(File.expand_path('../', __FILE__), 'railties', 'generators', 'compass_theme', 'compass_theme_generator.rb')
    end
  end
end