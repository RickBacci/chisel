

# /(.*)(\*.*\*)(.*)/ regex for *emp*
# You just *have* to try the cheesecake

# /(.*)(\*\*.*\*\*)(.*)/
#My *emphasized and **stronged** text* is awesome.


#file = File.readlines('./test/test_multiple.txt')#.each do |line|
#  file << line
#end
#p output = "line1\n\nline2\n"


# maybe this?

# code = <<-END.gsub(/^\s+\|/, '')
#   |def test
#   |  some_method
#   |  other_method
#   |end
# END
# # => "def test\n  some_method\n  other_method\nend\n"


# working for headers
# output = output.map do |line|
#   next unless header_regex.match(line)
#
#   headers = header_regex.match(line)
#   header_size = headers[1].length
#
#   "<h#{header_size}>#{headers[2]}</h#{header_size}>\n"
# end
