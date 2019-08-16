# :nodoc:
class Spec::Formatters::VerboseFormatter <  Spec::Formatter
  class Item
    def initialize(@indent : Int32, @description : String)
      @printed = false
    end

    def print(io)
      return if @printed
      @printed = true

      VerboseFormatter.print_indent(io, @indent)
      io.puts @description
    end
  end

  @indent = 0
  @last_description = ""
  @items = [] of Item

  def push(context)
    @items << Item.new(@indent, context.description)
    @indent += 1
  end

  def pop
    @items.pop
    @indent -= 1
  end

  def print_indent
    self.class.print_indent(@io, @indent)
  end

  def self.print_indent(io, indent)
    indent.times { io << "  " }
  end

  def before_example(description)
    @items.each &.print(@io)
    print_indent
    @io << description
    @last_description = description
  end

  def report(result)
    @io << '\r'
    print_indent
    @io.puts Spec.color(@last_description, result.kind)
  end

  def print_results(elapsed_time : Time::Span, aborted : Bool)
    Spec::RootContext.print_results(elapsed_time, aborted)
  end
end

