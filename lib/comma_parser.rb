module CommaParser
  
  module ParserMethods
    def allow_commas(*args)
      before_validation :strip_commas
      
      type_cast_array = []
      args.each do |arg|
        type_cast_array << "#{arg}_will_change!" 
        type_cast_array << "#{arg}_before_type_cast.to_s.tr!(',', '').to_i"
      end
      
      class_eval(
        %Q(
          def strip_commas
            #{type_cast_array.join(";")}
          end
        )
      )
    end
  end
end

ActiveRecord::Base.extend CommaParser::ParserMethods
