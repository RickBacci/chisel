
class MarkdownIO

  def self.read_markdown(input_file)
    File.read(input_file)
  end

  def self.write_html(input_file, output_file, html)

    File.open(output_file, "w") do |file|
      #binding.pry
      file.write(html)
    end
    output_file_line_count = %x{sed -n '=' #{output_file} | wc -l}.to_i
     input_file_line_count = %x{sed -n '=' #{input_file} | wc -l}.to_i
    puts "Converted #{input_file} (#{input_file_line_count} lines) to #{output_file} (#{output_file_line_count} lines)"
  end
end




# expected input line
#$ ruby ./lib/chisel.rb my_input.markdown my_output.html

# expected output line
# Converted my_input.markdown (6 lines) to my_output.html (8 lines)
