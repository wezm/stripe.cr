require "http/params"

class HTTP::Params::Builder
  def add(key, value : Hash | NamedTuple, path : Array(String)? = nil)
    value.each do |k, v|
      if v.is_a?(Hash) || v.is_a?(NamedTuple)
        _path = path ? path.dup : [key]
        add(k, v, _path.push(k.to_s))
      elsif v.nil?
        # Skip nil values
      else
        if path
          _path = path.dup.push(k.to_s)
          _key = _path.first + _path[1..-1].join("") { |p| "[#{p}]" }
        else
          _key = "#{key}[#{k}]"
        end

        # Values are converted to strings
        add(_key, v.to_s)
      end
    end

    self
  end
end
