require 'placeholder/version'
require 'placeholder/logging'
require 'clamp'

module Placeholder
  class AbstractCommand < Clamp::Command
    include Logging

    option ["-v", "--verbose"], :flag, "be verbose"
    option "--version", :flag, "show version" do
      puts "Placeholder v" + Placeholder::VERSION
      exit(0)
    end

  end

  class PlaceholderCommand < AbstractCommand
      option "--format", "format", "Specify the output format. Options are [csv, json]", :attribute_name => :format, :default => 'csv'
      option "--depth", "depth", "Level of depth to recurse", :attribute_name => :depth, :default => -1 do |s|
        Integer(s)
      end

      parameter "show", "Which show to perform?", :attribute_name => :uri do |u|
        # validate the uri...
        u
      end
      parameter "[output_file]", "Output file", :attribute_name => :output_file

    def execute
      log.info("Magic happens!")
    end
  end

  class MainCommand < AbstractCommand
    subcommand "magic", "Does some placeholder magic", Placeholder::PlaceholderCommand
  end
end