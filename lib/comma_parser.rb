module CommaParser
  
  module ParserMethods
    def allow_commas(*args)
      args.each do |arg|
        class_eval(
          %Q(
            def #{arg}=(val)
              super(val.to_s.tr(',',''))
            end
          )
        )
      end
    end
  end
end

ActiveRecord::Base.extend CommaParser::ParserMethods
