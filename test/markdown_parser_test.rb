require './test/test_helper'

class MarkdownParserTest < MiniTest::Test

  def setup
    @markdown = MarkdownIO.read_markdown('./my_input.markdown')

  end

  def test_parser_exists
    parser = MarkdownParser.new(@markdown)
    assert parser
  end

  def test_parser_can_convert_a_header
    header = '# Header'
    parser = MarkdownParser.new(header)
    converted_header = parser.convert_headers
    assert_equal "<h1>Header<h1>", converted_header
  end

  def test_test_it_can_convert_a_bigger_header
    header = '##### Header 5'
    parser = MarkdownParser.new(header)
    converted_header = parser.convert_headers
    assert_equal "<h5>Header 5<h5>", converted_header

  end
  

end
