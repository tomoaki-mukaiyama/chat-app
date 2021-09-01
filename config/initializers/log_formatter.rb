class CustomFormatter < ActiveSupport::Logger::SimpleFormatter
    include ActiveSupport::TaggedLogging::Formatter
    def call(severity, time, progname, msg)   
        "[Level] #{severity} \n" +                                                  
        "[Time] #{time} \n" +                                                       
        "[Message] #{msg} \n\n"
    end                                                                           
end
Rails.logger.formatter = CustomFormatter.new
