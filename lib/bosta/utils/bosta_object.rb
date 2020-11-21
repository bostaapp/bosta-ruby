# frozen_string_literal: true

module Bosta #:nodoc: all
  class BostaObject
    def check_required_fields(*fields)
      fields.map do |field|
        value = instance_variable_get("@#{field}")
        if !instance_variable_defined?("@#{field}") || value.nil? || value.gsub(/\s+/, '').empty?
          raise "#{field} is not allowed to be empty"
        end
      end
    end

    def format_obj
      obj = {}
      instance_variables.map do |attribute|
        key = attribute.to_s.gsub('@', '')
        value = instance_variable_get(attribute)
        camel_key = key.split('_').map(&:capitalize).join
        camel_key[0] = camel_key[0].downcase
        obj[camel_key] = value unless value.nil?
      end
      obj
    end
  end
end
