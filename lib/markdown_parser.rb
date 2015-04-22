# * the series of convert_.. methods,
#   move them into one method on MarkdownParser
#   eg convert_all
# * make the first test use convert_all instead of convert_...
#   it will probably pass (convert_all will then call the original method)
# * make the second test use convert_all instead of convert_...
#   you may have integration issues with this one, but you're limiting
#   the set of failures and complexity by doing it one test / converter at a time
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
    convert_headers
    #convert_strong
  end

  def convert_headers
    header = /^(#+) *(.*)/.match(markdown)
    header_size = header[1].length

    header_tag = "<h#{header_size}>\\2</h#{header_size}>"
    markdown.gsub(/^(#+) *(.*)/, header_tag)
  end

  def convert_emphasis
    markdown.gsub(/\*(.*)\*/, "<em>\\1</em>" )
  end

  def convert_strong
    markdown.gsub(/\*\*(.*)\*\*/, "<strong>\\1</strong>" )
  end

  def generate_paragraphs
    get_chunks.map do |chunk|
      if header?(chunk) # no paragraphs for headers
        chunk
      else
        format_single_line_paragraph(chunk)
      end
    end.join
  end

  def generate_multi_line_paragraphs
    get_multi_chunks.map.with_index do |chunk, index|
      #binding.pry
      if chunk.empty? && get_multi_chunks[index + 1].empty?

        get_multi_chunks[index] = nil
      elsif chunk.empty? && get_multi_chunks[index + 1].empty?
        open_paragraph
      elsif chunk.empty?
        close_paragraph
      else
        multi_line(chunk)
      end
    end.compact!.join
  end

  def get_chunks
    markdown.split("\n\n").map do |chunk|
      chunk.gsub("\n", '')
    end
  end


  private

  def get_multi_chunks
    @markdown.split("\n")
  end

  def header?(chunk)
    chunk[0] == '#'
  end

  def open_paragraph
    %{<p>
}
  end

  def close_paragraph
    %{
</p>}
  end


  def multi_line(chunk)
    %{
  #{chunk}</br>}
  end

  # def format_multiple_line_paragraph(chunk)
  # end

  def multiple_lines?(chunk)
    chunk.include?("\n")
  end

  def format_single_line_paragraph(chunk)
    %{<p>
  #{chunk}
</p>
}
  end
end

