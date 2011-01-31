require 'json'
module Flowplayer
  class Player
    attr_accessor :options, :functions, :dom_id
    def initialize(dom_id, &block)
      @dom_id = dom_id
      @options = {}
      @functions = {}
      block.call(self)
      self
    end
    
    def to_js
      json = options_to_javascript
      json += functions_to_javascript
      "{#{json.join(', ')}}"
    end
    
    def script_tags
      <<-EOS
        <script type='text/javascript'>
          //<![CDATA[
            flowplayer("#{dom_id}", #{to_js})
          //]]>
        </script>
      EOS
    end
    
    private
    
    def functions_to_javascript
      functions.map {|option, function| "\"#{option}\":#{function}"}
    end
    
    def options_to_javascript
      options.map do |option, value| 
        if value.is_a?(String)
          "\"#{option}\":\"#{value.to_json}\""
        else
          "\"#{option}\":#{value.to_json}"
        end
      end
    end
    
    def method_missing(method, *args, &block)
      raise "Setters are not supported use method('whatever') to set configs" if /\=$/.match(method.to_s)
      if block.nil?
        options[method] = args.first
      else
        functions[method] = "function() { #{block.call.gsub(/\;$/, '')}; }"
      end
      return method
    end
    
  end
end