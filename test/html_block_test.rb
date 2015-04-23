require './test/test_helper'

class HtmlBlockTest < Minitest::Test

  def test_can_generate_unordered_list
    uo_list = "* Sushi"
    #parser = MarkdownParser.new(uo_list)

    html_blocks = HtmlBlockItems.new(uo_list)
    unordered = html_blocks.process_block_items
    uo_html = "<p>\n  <ul>    <li>Sushi</li>\n  </ul>\n</p>\n"
    assert_equal uo_html , unordered
  end

  def test_can_generate_another_unordered_list
    uo_list = "* Sushi\n* Barbeque"

    html_blocks = HtmlBlockItems.new(uo_list)
    unordered = html_blocks.process_block_items

    uo_html = "<p>\n  <ul>    <li>Sushi</li>\n    <li>Barbeque</li>\n  </ul>\n</p>\n"

    assert_equal uo_html , unordered
  end

  def test_does_not_generate_unordered_list_on_empty_string
    uo_list = ""

    html_blocks = HtmlBlockItems.new(uo_list)
    unordered = html_blocks.process_block_items

    uo_html = ""
    assert_equal uo_html , unordered
  end

  def test_can_generate_unordered_list_with_process_block_items
    uo_list = "* Sushi\n* Barbeque"

    html_blocks = HtmlBlockItems.new(uo_list)
    unordered = html_blocks.process_block_items
    uo_html = "<p>\n  <ul>    <li>Sushi</li>\n    <li>Barbeque</li>\n  </ul>\n</p>\n"

    assert_equal uo_html , unordered
  end


  def test_can_generate_ordered_list
    o_list = "1. Sushi"

    html_blocks = HtmlBlockItems.new(o_list)
    ordered = html_blocks.process_block_items
    o_html = "<p>\n  <ol>\n    <li>Sushi</li>\n  </ol>\n</p>\n"
    assert_equal o_html , ordered
  end

  def test_can_generate_another_ordered_list
    o_list = "1. Sushi\n2. Barbeque"

    html_blocks = HtmlBlockItems.new(o_list)
    ordered = html_blocks.process_block_items
    o_html = "<p>\n  <ol>\n    <li>Sushi</li>\n    <li>Barbeque</li>\n  </ol>\n</p>\n"
    assert_equal o_html , ordered
  end

  def test_does_not_generate_ordered_list_on_empty_string
    o_list = ""

    html_blocks = HtmlBlockItems.new(o_list)
    ordered = html_blocks.process_block_items

    o_html = ""

    assert_equal o_html , ordered
  end

  def test_can_generate_ordered_list_with_html_blocks
    o_list = "1. Sushi\n2. Barbeque"

    html_blocks = HtmlBlockItems.new(o_list)
    ordered = html_blocks.process_block_items
    o_html = "<p>\n  <ol>\n    <li>Sushi</li>\n    <li>Barbeque</li>\n  </ol>\n</p>\n"

    assert_equal o_html , ordered
  end
end
