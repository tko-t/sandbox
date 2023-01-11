class Service
  def self.run!(attr)
    service = new(attr)
    service.send(:run!)
    service
  end

  private

  def initialize(attr)
    attr.each do |key, value|
      # アクセサが必要
      raise ActiveModel::UnknownAttributeError.new(self, key) unless respond_to?("#{key}=")
      instance_variable_set("@#{key}", value)
    end
  end

  def run!
    raise 'implement'
  end

  def attr_to_h(keys)
    keys.each.with_object({}) do |key, h|
      h[key] = send(key)
    end
  end
end
