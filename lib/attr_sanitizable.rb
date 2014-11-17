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
          actions.each do |action|
            if !value.respond_to?(action)
              raise ArgumentError, "Unable to perform '#{action}' on a variable of type '#{value.class.name}'"
            end
            value = value.try(action)
          end
          write_attribute(field, value)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, AttrSanitizable)