module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_set("@#{name}_history", eval("#{name}_history") << value)
      end

      define_method("#{name}_history") { instance_variable_get("@#{name}_history") || [] }
    end
  end

  def strong_attr_acessor(name, type)
    var_name = "@#{name}".to_sym

    define_method(name) { instance_variable_get(var_name) }

    define_method("#{name}=".to_sym) do |value|
      if value.class == type
        instance_variable_set(var_name, value)
      else
        raise "Неверный тип присваемого значения"
      end
    end
  end
end