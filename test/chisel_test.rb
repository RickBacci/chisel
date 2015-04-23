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

    #html = "<h1>My Life in Desserts</h1>\n\n<h1>Chapter 1: The Beginning</h1>\n\n<p>\n  \"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in\n  <strong>Food amp; Wine</strong> this place has been packed every night.\"\n</p>"
    html = "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\"\n\n\n* whatever\n* i'm tired.\n* deal with it.\n\n1. yeah\n2. i'm slow\n3. pizza\n\n\n\nThis is [an example](http://example.com/ \"Title\") inline link.\n\n[This link](http://example.net/) has no title attribute.\n"
    MarkdownIO.write_html(input, output, html)

    assert_equal html, chisel.start_parser
  end
end


