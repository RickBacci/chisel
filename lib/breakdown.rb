require 'pry'

# output =
#   [
#     "# My Life in Desserts\n",
#     "\n",
#     "## Chapter 1: The Beginning\n",
#     "\n",
#     "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n",
#     "**Food & Wine** this place has been packed every night.\"\n"
#   ]
#
# #puts output
# # output = ["My *emphasized and **stronged** text* is awesome."]
#
# header_regex = /^(#+)\s(.*)$/
#
# #output = ["# My Life in Desserts\n", "## foo\n", "### bar\n", "#### baz\n", "##### whatever"]
#
# output = output.map do |line| # handles all headers
#
#   if header_regex.match(line)
#         header = header_regex.match(line)
#     header_size = header[1].length
#         "<h#{header_size}>#{header[2]}</h#{header_size}>\n"
#   else
#     line
#   end
# end
#
# #puts output
#
# strong_regex = /(.*)(\*\*.*\*\*)(.*)/
#
# output = output.map do |line| # strong
#
#   if strong_regex.match(line)
#     strong = strong_regex.match(line)
#
#     "#{strong[1]}<strong>#{strong[2].gsub('*', '')}</strong>#{strong[3]}\n"
#   else
#     line
#   end
# end
#
# #puts output
#
#
#
# emp_regex = /(.*)(\*.*\*)(.*)/
#
# @count_input_lines = 0
#
# output = output.map.with_index do |line, index| # emphasis
#   @count_input_lines += 1 # use index instead?
#   puts index
#   if emp_regex.match(line)
#     emp = emp_regex.match(line)
#     puts 'test line'
#     puts line.gsub(/\*(.*)\*/,'<em>\1</em>')
#    # "#{emp[1]}<emp>#{emp[2].gsub('*', '')}</emp>#{emp[3]}\n" # this won't work if emp is at beginning?
#   else
#     line
#   end
# end
# input_file = './test_output.txt'
# puts "This #{input_file} has #{@count_input_lines} lines"
# puts output
#
# @count_output_lines = 0
# File.open(input_file, 'w') do |file|
#   output.each { |line| file.write(line); @count_output_lines += 1  }
# end
# puts
# puts "This file has #{@count_output_lines} lines"
#
#
# #### when looping thru the lines store the line type in array
# ## i.e [:header, :empty_line, :header,:empty_line, :chunk, :chunk]
#
# # parse again assigning correct paragraph tags...
# # what if no newline at end with incomplete tag?
#
#
#





puts "============================================================================================="

# output =
#   [
#     "# My Life in Desserts\n",
#     "\n",
#     "## Chapter 1: The Beginning\n",
#     "\n",
#     "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n",
#     "**Food & Wine** this place has been packed every night.\"\n"
#   ]


output = "a par
same par

new par

**em on one line
continueing**

# h1
## h2".split("\n")



@input_length = 0
output = output.map.with_index do |line, index|

  case line

  when /^(#+)\s(.*)$/ #header

    header = /^(#+)\s(.*)$/.match(line)
    header_size = header[1].length
    "<h#{header_size}>#{header[2]}</h#{header_size}>\n"

  when /\*\*(.*)\*\*/ # strong
    line.gsub(/\*\*(.*)\*\*/, "<strong\\1</strong>" )

  when /\*(.*)\*/ #### emphsis....strong has to go first.....need better regex for this
    line.gsub(/\*(.*)\*/, "<em\\1</em>" )
  when /\n/
    "\n"
  when /&/
    line.gsub(/&/, 'amp;') ## needs to be method calls to treat every instance in every line
  else
    line
  end
end

puts output
