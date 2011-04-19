module Flowplayer
  module Helper

    # flowplayer_for :hubble do |f|
    #  f.option 'foo'
    #  f.onLoad do
    #    'this.unmute();'
    #  end


    def flowplayer_for(id, swf, lib='jquery', &block)
      Player.new(id, swf, lib, &block).script_tags.html_safe
    end

  end
end