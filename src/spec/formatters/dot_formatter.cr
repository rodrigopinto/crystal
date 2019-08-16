# :nodoc:
class Spec::Formatters::DotFormatter <  Spec::Formatter
  def report(result)
    @io << Spec.color(LETTERS[result.kind], result.kind)
    @io.flush
  end

  def finish
    @io.puts
  end

  def print_results(elapsed_time : Time::Span, aborted : Bool)
    Spec::RootContext.print_results(elapsed_time, aborted)
  end
end
