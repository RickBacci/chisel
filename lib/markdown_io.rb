
class MarkdownIO

  def self.read_markdown(file)
    File.readlines(file)
  end

  def self.write_html(output_file, html)
    File.write(output_file, html)
    # may need the block to count lines
    # File.open(output_file, 'w') {|f| f.write(html.to_s) }
  end
end




# expected input line
#todo $ ruby ./lib/chisel.rb my_input.markdown my_output.html

# expected output line
#todo Converted my_input.markdown (6 lines) to my_output.html (8 lines)
