require './test/test_helper'

class MarkdownParserTest < MiniTest::Test

  def test_parser_exists
    data = 'test'
    parser = MarkdownParser.new(data)
    assert parser
  end

  def test_parser_can_convert_a_header
    header = '# Header'
    parser = MarkdownParser.new(header)
    converted_header = parser.convert_headers
    assert_equal "<h1>Header</h1>", converted_header
  end

  def test_test_it_can_convert_a_bigger_header
    header = '##### Header 5'
    parser = MarkdownParser.new(header)
    converted_header = parser.convert_headers
    assert_equal "<h5>Header 5</h5>", converted_header
  end

  def test_can_convert_emphasis
    em = '*emphasis*'
    parser = MarkdownParser.new(em)
    emphasis = parser.convert_emphasis
    assert_equal "<em>emphasis</em>", emphasis
  end

  def test_can_convert_strong
    str = '**strong**'
    parser = MarkdownParser.new(str)
    strong = parser.convert_strong
    assert_equal "  <strong>strong</strong>", strong
  end

  def test_can_convert_ampersand
    amp = '&'
    parser = MarkdownParser.new(amp)
    ampersand = parser.convert_ampersand
    assert_equal "amp;", ampersand
  end

  def test_converting_an_inline_link_with_no_title_by_itself
    link = "[This link](http://example.net/)"

    parser = MarkdownParser.new(link)
    inline_link = parser.convert_inline_link_with_no_title

    link_html = "<a href=\"http://example.net/\">This link</a>"
    assert_equal link_html, inline_link
  end

  def test_converting_an_inline_link_by_itself
    link = "[an example](http://example.com/ \"Title\")"

    parser = MarkdownParser.new(link)
    inline_link = parser.convert_inline_link_with_title

    link_html = "<a href=\"http://example.com/\" title=\"Title\">an example</a>"
    assert_equal link_html, inline_link
  end

  def test_converting_an_inline_link_with_title
    link = "[an example](http://example.com/ \"Title\")"

    parser = MarkdownParser.new(link)
    inline_link = parser.convert_inline_link_with_title


    link_html = "<a href=\"http://example.com/\" title=\"Title\">an example</a>"
    assert_equal link_html, inline_link
  end
end

# ![Alt text](/path/to/img.jpg)
#
# ![Alt text](/path/to/img.jpg "Optional title")
