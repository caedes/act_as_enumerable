require 'active_support/core_ext/string'

module ActAsEnumerable

  def self.included(base)
    base.define_singleton_method(:enum) do |name, enumeration|
      ActAsEnumerable.enum_method base, name, enumeration
    end
  end

protected

  def self.enum_method(base, name, enumeration)
    ActAsEnumerable.enum_getter_method base, name, enumeration
  end

  def self.enum_getter_method(base, name, enumeration)
    base.define_singleton_method("#{name}_values") do
      enumeration
    end
    base.define_singleton_method("#{name}_captions") do
      enumeration.map do |value|
        value.to_s.humanize
      end
    end
  end
end

# class Object
#   def self.enum name, enumeration
#     name = name.to_s

#     enumeration.each do |value|
#       value = value.to_s
#       eval "
#         def #{value}?
#           self.#{name} == '#{value}'
#         end
#         def #{value}!
#           self.#{name} = '#{value}'
#         end"
#     end
#     eval "
#       def humanize_#{name} value
#         value = value.to_s
#         begin
#           Required::Module::const_get 'I18n'
#           ::I18n.t \"enum.#{self.to_s.underscore}.#{name}.#{'#{value}'}\"
#         rescue NameError
#           value
#         end
#       end
#       def #{name}_caption
#         self.#{name}.nil? ? self.#{name} : humanize_#{name}(self.#{name})
#       end"

#     # validates_inclusion_of name.to_sym, { allow_nil: true, in: enumeration } if self.ancestors.include? 'ActiveRecord::Base'
#   end
# end
