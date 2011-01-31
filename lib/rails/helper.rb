module Flowplayer
  module Helpers
    
    # flowplayer_for :hubble do |f|
    #  f.option 'foo'
    #  f.onLoad do
    #    'this.unmute();'  
    #  end
    
  
    
    
    
    def flowplayer_for(id, &block)
      FlowPlayer::Player.new(id, &block)
    end
      
  end
end