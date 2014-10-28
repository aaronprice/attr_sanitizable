module AttrSanitizable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attr_sanitizable(*attributes)
      raise ArgumentError, "You need to supply at least one attribute" if attributes.empty?

      defaults = attributes.extract_options!.dup
      actions  = defaults[:with] || []

      attributes.each do |field|
        define_method "#{field}=" do |value|
          actions.each { |action| value = value.try(action) }
          write_attribute(field, value)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, AttrSanitizable)