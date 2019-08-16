module FormatterSpecHelper
  extend self

  def exception_with_backtrace(msg)
    begin
      raise Exception.new(msg)
    rescue e
      e
    end
  end
end