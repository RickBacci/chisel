require 'pry'

class MarkdownParser
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def convert_headers
    header = /^(#+) *(.*)/.match(markdown)
    header_size = header[1].length

    header_tag = "<h#{header_size}>\\2</h#{header_size}>"
    markdown.gsub(/^(#+) *(.*)/, header_tag)
  end

  def generate_paragraphs
    get_chunks.map do |chunk|
      if header?(chunk) # no paragraphs for headers
        chunk
      else
        format_paragraph(chunk)
      end
    end.join
  end




  # methods for this classes methods only
  private

  def get_chunks
    markdown.split("\n\n").map do |chunk|
      chunk.gsub("\n", '')
    end
    #markdown.split("\n\n")
  end

  def header?(chunk)
    chunk[0] == '#'
  end

  def format_paragraph(chunk)
    "<p>\n  #{chunk}\n</p>\n"
  end

end

