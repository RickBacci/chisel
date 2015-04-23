require './test/test_helper'

class ChiselTest < Minitest::Test

  def test_we_have_a_chisel
    markdown = "markdown"
    output = './my_output.html'

    chisel = Chisel.new(@input, output, markdown)
    assert chisel
  end

  def test_that_chisel_can_take_two_files
    chisel = Chisel.new('in', 'out', @markdown)
    assert_equal 'in', chisel.input_file
    assert_equal 'out', chisel.output_file
  end

  def test_that_chisel_can_build_html_file
    input = './my_input.markdown'
    output = './my_output.html'

    markdown = MarkdownIO.read_markdown(input)
    chisel = Chisel.new(input, output, markdown)

    html = "<h1>My Life in Desserts</h1>\n\n<h1>Chapter 1: The Beginning</h1>\n\n<p>\n  \"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in\n  <strong>Food amp; Wine</strong> this place has been packed every night.\"\n</p>\n\n\n<p>\n  <ul>\n    <li>whatever</li>\n    <li>i'm tired.</li>\n    <li>deal with it.</li>\n  </ul>\n</p>\n\n\n<p>\n  <ol>\n    <li>yeah</li>\n    <li>i'm slow</li>\n    <li>pizza</li>\n  </ol>\n</p>\n\n\n\n\n<p>\n  This is <a href=\"http://example.com/\" title=\"Title\">an example</a> inline link.\n</p>\n\n\n<p>\n  <a href=\"http://example.net/\">This link</a> has no title attribute.\n</p>\n"

    MarkdownIO.write_html(input, output, html)
    assert_equal html, chisel.start_parser
  end
end


