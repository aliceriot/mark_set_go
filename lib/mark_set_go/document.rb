class Document
  attr_accessor :sections, :lines

  def initialize(lines)
    @sections = []
    @lines = lines

    @current_section = nil
    @lines.each do |line|
      if @current_section.nil?
        if line.strip == "" # skip initial whitespace
          next
        elsif comment_check(line)
          @current_section = Comment.new(line)
        else
          @current_section = Code.new(line)
        end

      elsif @current_section.class == Code
        if comment_check(line)
          push_current_section
          @current_section = Comment.new(line)
        else
          @current_section.lines << line
        end

      elsif @current_section.class == Comment
        if @current_section.type == "block"
          if check_block_end(line)
            push_current_section
          else
            @current_section.lines << line
          end
        elsif @current_section.type == "line"
          if check_block_start(line)
            push_current_section
            @current_section = Comment.new(line)
          else
            if comment_check(line)
              @current_section.lines << line
            elsif line.strip == ""
              @current_section.lines << line
            else
              push_current_section
              @current_section = Code.new(line)
            end
          end
        end
      end
    end
    if !@current_section.nil?
      push_current_section
    end
  end

  def comment_check(line)
    ["/*", "//"].map { |str| line.strip.start_with? str }.include? true
  end

  def check_block_start(line)
    line.strip.start_with? "/*"
  end

  def check_block_end(line)
    line.strip.end_with? "*/"
  end

  def push_current_section
    @sections << @current_section.dup
    @current_section = nil
  end

  def to_s
    @sections.map(&:to_s).join("\n").strip
  end
end
