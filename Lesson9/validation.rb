module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, option = nil)
      @check_array ||= []
      @check_array << { name: name, type: type, option: option }
    end
  end

  module InstanceMethods
    def validate!
      our_class = self.class
      while our_class != Object
        if check_array = our_class.class_eval('@check_array')
          check_array.each do |value|
            var = instance_variable_get("@#{value[:name]}")
            method_checking = "#{value[:type]}"
            send method_checking, var, value[:option] if value[:option]
          end
        end
        our_class = our_class.superclass
      end
    end

    def valid?
      validate!
    rescue ArgumentError
      false
    end

    private

    def presence_check(name)
      raise "Не может быть пустым!" if name.empty?
      raise "Не может быть nil!" if name.nil?
    end

    def format_check(name, format)
      raise "Неверный формат!" unless name =~ format
    end

    def type_check(name, type)
      raise "Неверный тип!" unless name.is_a?(type)
    end
  end
end