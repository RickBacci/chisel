require_relative 'markdown_io'
require_relative 'markdown_parser'

class Chisel
  attr_reader :input_file, :output_file, :markdown

  def initialize(input_file, output_file, markdown)

    @input_file = input_file
    @output_file = output_file
    @markdown = markdown
  end

  def chisel

    parser = MarkdownParser.new(markdown)

    parser.convert_all


  end
end



if __FILE__ == $0
  markdown = MarkdownIO.read_markdown(ARGV[0])
  puts; puts
  chisel = Chisel.new(ARGV[0], ARGV[1], markdown)
  puts chisel.chisel

  puts; puts
  #chisel_output_file = MarkdownIO.write_html(ARGV[1], markdown)
end




