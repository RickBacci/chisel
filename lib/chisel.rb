require_relative 'markdown_io'
require_relative 'markdown_parser'

class Chisel
  attr_reader :input_file, :output_file, :markdown

  def initialize(input_file, output_file, markdown)

    @input_file = input_file
    @output_file = output_file
    @markdown = markdown
  end

  def start_parser
    parser = MarkdownParser.new(markdown)
    parser.convert_all
  end
end



if __FILE__ == $0
  markdown_file = MarkdownIO.read_markdown(ARGV[0])

  chisel = Chisel.new(ARGV[0], ARGV[1], markdown_file)
  html = chisel.start_parser

  MarkdownIO.write_html(ARGV[0], ARGV[1], html)
end
