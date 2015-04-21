
class MarkdownParser
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def convert_headers
    header = /^(#+)(.*)$/.match(markdown)
    header_size = header[1].length

    header_tag = "<h#{header_size}>\\2<h#{header_size}>"
    markdown.gsub(/^(#+)\s(.*)$/, header_tag)

    #"<h#{header_size}>#{header[2]}</h#{header_size}>\n"
  end

end

