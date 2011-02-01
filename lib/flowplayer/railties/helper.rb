module Flowplayer
  module Helper
    
    # flowplayer_for :hubble do |f|
    #  f.option 'foo'
    #  f.onLoad do
    #    'this.unmute();'  
    #  end
    
  
    def flowplayer_for(id, swf, &block)
      Player.new(id, swf, &block).script_tags.html_safe
    end
      
  end
end