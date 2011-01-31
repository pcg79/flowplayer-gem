module Flowplayer
  module Helpers
    
    # flowplayer_for :hubble do |f|
    #  f.option 'foo'
    #  f.onLoad do
    #    'this.unmute();'  
    #  end
    
  
    
    
    
    def flowplayer_for(id, swf, &block)
      FlowPlayer::Player.new(id, swf, &block).script_tags
    end
      
  end
end