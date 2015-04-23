require_relative 'html_block_items'
require 'pry'

class MarkdownParser
  attr_accessor :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def convert_all
    html_blocks = HtmlBlockItems.new(markdown)
    @markdown = html_blocks.process_block_items

    convert_headers if header_match_found?
    convert_strong if strong_match_found?
    convert_emphasis if emphasis_match_found?
    convert_ampersand if ampersand_match_found?

    convert_inline_link_with_title
    convert_inline_link_with_no_title
  end

  def convert_headers
    unless /^(#+) *(.*)/.match(markdown).nil?
      header = /^(#+) *(.*)/.match(markdown)
      header_size = header[1].length

      header_tag = "<h#{header_size}>\\2</h#{header_size}>"
      @markdown = markdown.gsub(/^(#+) *(.*)/, header_tag)
    end
   end

  def convert_emphasis
     @markdown = markdown.gsub!(/\*(.*)\*/, "<em>\\1</em>")
  end

  def convert_strong
    @markdown = markdown.gsub(/\*\*(.*)\*\*/, "  <strong>\\1</strong>")
  end

  def convert_ampersand
    @markdown = markdown.gsub('&', 'amp;')
  end

  def convert_inline_link_with_no_title
    if @markdown.match(/\[(.*)\]\((.*)[^"]\)/)
      @markdown = markdown.gsub(/\[(.*)\]\((.*)[^"]\)/, "<a href=\"\\2/\"\\3>\\1</a>")
    end
  end

  def convert_inline_link_with_title
    if @markdown.match(/\[(.*)\]\((.*) "(.*)"\)/)
      @markdown = markdown.gsub(/\[(.*)\]\((.*) "(.*)"\)/, "<a href=\"\\2\" title=\"\\3\">\\1</a>")
    end
  end


  private


  def header_match_found?
    /^(#+)\s(.*)$/
  end

  def strong_match_found?
    /\*\*(.*)\*\*/
  end

  def emphasis_match_found?
    /\*(.*)\*/
  end

  def ampersand_match_found?
    /&/
  end

  def unordered_list_found?
    /^\* (.*)/
  end

  def ordered_list_found?
    /^\d+\. (.*)/
  end

  def inline_link_with_title_found?
    /\[(.*)\]\((.*) "(.*)"\)/
  end

  def inline_link_with_no_title_found?
    /\[(.*)\]\((.*)[^"]\)/
  end
end
