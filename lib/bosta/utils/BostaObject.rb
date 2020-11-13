class BostaObject
    def initialize
        raise 'This is an abstract class'
    end
    def checkRequiredFields(*fields)
        fields.map do |field|
            value = instance_variable_get("@#{field}")
            if !instance_variable_defined?("@#{field}") || value.nil? || value.gsub(/\s+/, '').empty?
                raise "#{field} is not allowed to be empty"
            end
        end
    end

    def getFormattedObj
        obj = {}
        instance_variables.map do |attribute|
            key = attribute.to_s.gsub('@', '')
            value = self.instance_variable_get(attribute)
            obj[key] = value unless value.nil?
        end
        return obj
    end 
end