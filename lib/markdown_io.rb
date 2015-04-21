
class MarkdownIO

  def self.read_markdown(file)
    File.read(file)
  end

  def self.write_html(output_file, converted_md)

    File.open(output_file, 'w') do |file|
    #   converted_md.each { |line| file.write(line) }
      file.write(converted_md)
    end
  end
end




# expected input line
#todo $ ruby ./lib/chisel.rb my_input.markdown my_output.html

# expected output line
#todo Converted my_input.markdown (6 lines) to my_output.html (8 lines)
