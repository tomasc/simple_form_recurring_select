module SimpleFormRecurringSelect
  module HasRecurrenceRule
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
      end
    end

    module ClassMethods
      def has_recurrence_rule(accessor_name = :recurrence_rule)
        attr_reader accessor_name

        define_method "#{accessor_name}=" do |value|
          case value
          when NilClass, 'null' then nil
          else instance_variable_set "@#{accessor_name}", IceCube::Rule.from_hash(JSON.parse(value))
          end
        end
      end
    end
  end
end
