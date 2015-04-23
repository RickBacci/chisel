
# * With the `["", "...", "..."]`, where the empty string was messing up
#   the paragraphs, we can first remove it and then map it:
#   [18] pry(main)> [1,2,3,4,5].reject { |n| n == 3 }.map { |n| n.even? }
#   => [false, true, true, false]

require 'pry'

class MarkdownParser
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def convert_all
    #generate_paragraphs

    convert_headers if header_match_found?
    convert_strong if strong_match_found?
    convert_emphasis if emphasis_match_found?
    convert_ampersand if ampersand_match_found?


    generate_ordered_list
    generate_unordered_list
    convert_inline_links
  end

  def convert_headers
    if header?(markdown)
      header = /^(#+) *(.*)/.match(markdown)
      header_size = header[1].length

      header_tag = "<h#{header_size}>\\2</h#{header_size}>"
      @markdown = @markdown.gsub(/^(#+) *(.*)/, header_tag)
    end
   end

  def convert_emphasis
     @markdown = @markdown.gsub!(/\*(.*)\*/, "<em>\\1</em>")
  end

  def convert_strong
    @markdown = @markdown.gsub(/\*\*(.*)\*\*/, "<strong>\\1</strong>")
  end

  def convert_ampersand
    @markdown = @markdown.gsub('&', 'amp;')
  end

  def generate_paragraphs

     text = get_chunks.map.with_index do |chunk, index|
       if header?(chunk)
         chunk
       else
         get_chunks[index] = format_single_line_paragraph(chunk)
       end
     end
     @markdown = text.join("\n\n")
  end

  def generate_unordered_list
    if @markdown.match(/^\* (.*)/).nil?
      @markdown
    else
      @markdown = @markdown.gsub(/^\* (.*)/, "  <li>\\1</li>")
    end
    return @markdown
  end

  def generate_ordered_list
    if @markdown.match(/^\d+\. (.*)/).nil?
      @markdown
    else
      @markdown = @markdown.gsub(/^\d+\. (.*)/, "  <li>\\1</li>")
    end
    return @markdown
  end

  def convert_inline_links
    if @markdown.match(/\[(.*)\]\((.*) "(.*)"\)$/)
      @markdown = @markdown.gsub(/\[(.*)\]\((.*) "(.*)"\)$/, "<a href=\"\\2\" title=\"\\3\">\\1</a>")
    elsif @markdown.match(/\[(.*)\]\((.*)[^"]\)$/)
      @markdown = @markdown.gsub(/\[(.*)\]\((.*)[^"]\)$/, "<a href=\"\\2/\"\\3>\\1</a>")
    end
    return @markdown
  end

  private

  def get_chunks
    @markdown.split("\n\n")
  end

  def header?(chunk)
    chunk[0] == "#"
  end

  def format_single_line_paragraph(chunk)
    "<p>\n  #{chunk}</p>"
  end

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
end

