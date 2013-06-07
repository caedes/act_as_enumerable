unless String.methods.include? 'underscore'
  class String
    def underscore
      self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end
  end
end

class Object
  def self.enum name, enumeration
    name = name.to_s
    class_eval "
      attr_accessor :#{name}
      def self.#{name}_values
        #{enumeration}
      end
      def self.#{name}_captions
        #{enumeration}.map do |value|
          humanize_#{name} value
        end
      end"
    enumeration.each do |value|
      value = value.to_s
      eval "
        def #{value}?
          self.#{name} == '#{value}'
        end
        def #{value}!
          self.#{name} = '#{value}'
        end"
    end
    eval "
      def humanize_#{name} value
        value = value.to_s
        begin
          Required::Module::const_get 'I18n'
          ::I18n.t \"enum.#{self.to_s.underscore}.#{name}.#{'#{value}'}\"
        rescue NameError
          value
        end
      end
      def #{name}_caption
        self.#{name}.nil? ? self.#{name} : humanize_#{name}(self.#{name})
      end"

    # validates_inclusion_of name.to_sym, { allow_nil: true, in: enumeration } if self.ancestors.include? 'ActiveRecord::Base'
  end
end
