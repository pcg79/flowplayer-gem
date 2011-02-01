require 'json'
module Flowplayer
  class Player
    attr_accessor :options, :functions, :dom_id, :swf
    def initialize(dom_id, swf, lib='jquery', &block)
      @dom_id, @swf, @lib = dom_id, swf, lib
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
      final = library("flowplayer(\"#{dom_id}\", \"#{swf}\", #{to_js});")
      <<-EOS
        <script type='text/javascript'>
          //<![CDATA[
              #{final}
          //]]>
        </script>
      EOS
    end
    
    def library(func)
      case @lib
        when 'jquery'
          jquery(func)
        when 'prototype'
          prototype(func)
      end
    end
    
    def jquery(func)
      <<-EOS
      $(document).ready(function() {
        #{func}
      });
      EOS
    end
    
    def prototype(func)
      <<-EOS
        document.observe("dom:loaded", function() {
          #{func}
        });
      EOS
    end
    
    private
    
    def functions_to_javascript
      functions.map {|option, function| "\"#{option}\":#{function}"}
    end
    
    def options_to_javascript
      options.map do |option, value| 
        "\"#{option}\":#{value.to_json}"
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