module Spec
  # :nodoc:
  abstract class Formatter
    def initialize(@io : IO = STDOUT)
    end

    def push(context)
    end

    def pop
    end

    def before_example(description)
    end

    def report(result)
    end

    def finish
    end

    def print_results(elapsed_time : Time::Span, aborted : Bool)
    end
  end

  @@formatters = [Spec::Formatters::DotFormatter.new] of Spec::Formatter

  # :nodoc:
  def self.formatters
    @@formatters
  end

  def self.override_default_formatter(formatter)
    @@formatters[0] = formatter
  end

  def self.add_formatter(formatter)
    @@formatters << formatter
  end
end
