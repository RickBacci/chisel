
class Chisel
  attr_reader :input_file, :output_file, :markdown

  def initialize(input_file, output_file, markdown)

    @input_file = input_file
    @output_file = output_file
    @markdown = markdown
  end

  def build_html

    parser = MarkdownParser.new(markdown)

    parser.convert_headers

    '<h1>Input test file</h>'
  end
end



if __FILE__ == $0
  markdown = MarkdownIO.read_markdown(ARGV[0])

  chisel = Chisel.new(ARGV[0], ARGV[1], markdown)


  # blah = ['testing', 'one', 'two']
  # chisel_output_file = MarkdownIO.write_html(ARGV[1], blah)
end




