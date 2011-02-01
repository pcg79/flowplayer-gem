module Flowplayer
  require 'rails'
  require File.join(File.expand_path('../', __FILE__), 'railties/helper')
  class Railtie < ::Rails::Railtie
    generators do
      require File.join(File.expand_path('../', __FILE__), 'railties', 'generator', 'install_generator.rb')
    end
    initializer "flowplayer.configure_rails_initialization" do
      ActionController::Base.instance_eval do 
        helper Flowplayer::Helper
      end
    end
  end
end