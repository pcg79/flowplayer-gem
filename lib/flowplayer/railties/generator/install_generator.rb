module Flowplayer
  module Generator
    class InstallGenerator < Rails::Generators::Base
      namespace 'flowplayer'
      source_root File.expand_path("../../../../../assets", __FILE__)
      argument :install_type, :type => :string, :banner => "commercial", :required => false, :default => ''
      
      def install_flowplayer
        copy_file 'flowplayer-3.2.4.min.js', Rails.root.join('public', 'javascripts', 'flowplayer.min.js')
      end
      
      def install_swfs
        if install_type == 'commercial'
          copy_file 'flowplayer.commercial-3.2.5.swf', Rails.root.join('public', 'flowplayer.swf')
        else
          copy_file 'flowplayer-3.2.5.swf', Rails.root.join('public', 'flowplayer.swf')
          copy_file 'LICENSE.txt', Rails.root.join('FLOWPLAYER_LICENSE.txt')
        end
        copy_file 'flowplayer.controls-3.2.3.swf', Rails.root.join('public', 'flowplayer.controls.swf')
      end
      
    end
  end
end