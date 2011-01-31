module Flowplayer
  class PLayer
    attr_accessor :options
    def initialize(dom_id, &block)
      @options = []
      block.call
    end
    
    def method_missing(method, *args, &block)
      if block.nil?
        options[method] = args.first
      else
        options[method] = block.call
      end
    end
    
  end
end