require 'logger'

module Smartkiosk
  module Common
    module Logging

      def destination=(value)
        @destination = value
      end

      def service=(service)
        @service = service
      end

      def service
        @service
      end

      def logger=(val)
        @logger = (val ? val : Logger.new('/dev/null'))
      end

      def logger
        @logger ||= init
      end

      def init
        log = Logger.new(@destination || STDOUT)
        log.level = Logger::DEBUG
        log.formatter = proc do |severity, time, progname, msg|
          Smartkiosk::Common::Logging.format @service, severity, time, progname, msg
        end
        log
      end

      def self.format(service, severity, time, progname, msg)
        "#{service.ljust(10)} -- #{severity[0]}, " << 
        "[#{time.utc.strftime '%Y-%m-%dT%H:%M:%S.%6N'} ##{::Process.pid}] " <<
        "#{severity.rjust(5)} -- : #{msg}\n"
      end

    end
  end
end