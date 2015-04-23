
class MarkdownIO

  def self.read_markdown(input_file)
    File.read(input_file)
  end

  def self.write_html(input_file, output_file, html)

    File.open(output_file, "w") do |file|
      #binding.pry
      file.write(html)
    end
    puts return_result(input_file, output_file)
  end

  private

  def self.return_result(input_file, output_file)
    "Converted #{input_file} (#{count_lines(input_file)} lines)" <<
      " to #{output_file} (#{count_lines(output_file)} lines)"
  end

  def self.count_lines(file)
    %x{sed -n '=' #{file} | wc -l}.to_i
  end
end

# expected input line
#$ ruby ./lib/chisel.rb my_input.markdown my_output.html

# expected output line
# Converted my_input.markdown (6 lines) to my_output.html (8 lines)
