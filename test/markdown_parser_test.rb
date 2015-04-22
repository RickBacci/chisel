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
    converted_header = parser.convert_all
    assert_equal "<h1>Header</h1>", converted_header
  end

  def test_test_it_can_convert_a_bigger_header
    header = '##### Header 5'
    parser = MarkdownParser.new(header)
    converted_header = parser.convert_all
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
    strong = parser.convert_all
    assert_equal "<strong>strong</strong>", strong
  end

  def test_can_ignore_header_chunks
    chunks = "\nhello\n\n#world\n"
    parser = MarkdownParser.new(chunks)
    paragraph = parser.generate_paragraphs

    html =
    %{<p>
  hello
</p>
#world}

    assert_equal html , paragraph
  end

  def test_can_find_chunks
    chunks = "\nhello\n\nworld\n"
    parser = MarkdownParser.new(chunks)
    paragraph = parser.generate_paragraphs

    html = "<p>\n  hello\n</p>\n<p>\n  world\n</p>\n"
    assert_equal html , paragraph
  end

  def test_find_a_multi_line_paragraph
    skip
    multi_chunks = "\n\nfirstline\nsecondline\nthirdline\n\nfirstline\nsecondline\nthirdline\n\n"

    multi_parser = MarkdownParser.new(multi_chunks)
    multi_paragraph = multi_parser.generate_multi_line_paragraphs

    html =
    %{
<p>
  firstline
  secondline
  thirdline
</p>
}

    assert_equal html, multi_paragraph
  end
end
