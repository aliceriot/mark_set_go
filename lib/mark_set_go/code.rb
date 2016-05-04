class Code
  attr_accessor :lines

  def initialize(init_line)
    @lines = [init_line]
  end

  def to_s
    <<-HERE
```go
#{@lines.join("").strip}
```
HERE
  end
end
