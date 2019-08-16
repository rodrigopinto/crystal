# :nodoc:
class Spec::Formatters::TAPFormatter < Spec::Formatter
  @counter = 0

  def report(result)
    case result.kind
    when :success, :pending
      @io << "ok"
    when :fail, :error
      @io << "not ok"
    end

    @counter += 1

    @io << ' ' << @counter << " -"
    if result.kind == :pending
      @io << " # SKIP"
    end
    @io << ' ' << result.description

    @io.puts
  end

  def finish
    @io << "1.." << @counter
    @io.puts
  end
end
