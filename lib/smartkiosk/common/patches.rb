module Smartkiosk
  module Common
    module Patches
      def self.dante_should_log_with(logger)
        Dante::Runner.class_eval do
          define_method :log do |msg|
            logger.info msg
          end
        end
      end
    end
  end
end