require './test/test_helper'

class MarkdownParserTest < MiniTest::Test

  #def setup
    #@markdown = MarkdownIO.read_markdown('./my_input.markdown')
    #@parser = MarkdownParser.new(@markdown)

  #end

  #def test_parser_exists
    #@parser = MarkdownParser.new(@markdown)
    #assert @parser
  #end

  def test_parser_can_convert_a_header
    header = '# Header'
    parser = MarkdownParser.new(header)
    converted_header = parser.convert_all
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
    assert_equal "<strong>strong</strong>", strong
  end

  def test_can_convert_ampersand
    amp = '&'
    parser = MarkdownParser.new(amp)
    ampersand = parser.convert_ampersand
    assert_equal "amp;", ampersand
  end

  def test_can_generate_unordered_list
    uo_list = "* Sushi"
    parser = MarkdownParser.new(uo_list)
    unordered = parser.generate_unordered_list

    uo_html = "<ul>
  <li>Sushi</li>
</ul>"
    assert_equal uo_html , unordered
  end

  def test_can_generate_another_unordered_list
    uo_list = "* Sushi\n* Barbeque"
    parser = MarkdownParser.new(uo_list)
    unordered = parser.generate_unordered_list

    uo_html = "<ul>
  <li>Sushi</li>
  <li>Barbeque</li>
</ul>"
    assert_equal uo_html , unordered
  end

  def test_does_not_generate_unordered_list_on_empty_string
    uo_list = ""
    parser = MarkdownParser.new(uo_list)
    unordered = parser.generate_unordered_list

    uo_html = ""
    assert_equal uo_html , unordered
  end

  def test_can_generate_unordered_list_with_convert_all
    uo_list = "* Sushi\n* Barbeque"
    parser = MarkdownParser.new(uo_list)
    unordered = parser.convert_all

    uo_html = "<ul>
  <li>Sushi</li>
  <li>Barbeque</li>
</ul>"
    assert_equal uo_html , unordered
  end

  def test_can_generate_ordered_list
    o_list = "1. Sushi"
    parser = MarkdownParser.new(o_list)
    ordered = parser.generate_ordered_list

    o_html = "<ol>
  <li>Sushi</li>
</ol>"
    assert_equal o_html , ordered
  end


end
