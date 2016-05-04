class Comment
  attr_accessor :lines, :type

  def initialize(init_line)
    @lines = [init_line]
    set_type
  end

  def set_type
    if @lines.first.start_with? "/*"
      @type = "block"
    else
      @type = "line"
    end
  end

  def remove_comment(line)
    if /^\/\//.match(line)
      line.gsub(/^\/\//, '')
    elsif /^\/\*/.match(line)
      line.gsub(/^\/\*/, '')
    else
      line
    end
  end

  def to_s
    @lines.map { |line| remove_comment(line) }.join("")
  end
end
