input_string =
'# My Life in Desserts

## Chapter 1: The Beginning

  "You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'

# p input_string.each_with_index do |character, index|
#   second_em = nil
#   if character == '*' && second_em.nil?
#     first_em = index
#     second_em = 1
#   elsif character = '*' && second_em == 1
#     input_string[first_em..index] = 'hello'
#   end

  p input_string

puts


  #### string split by the '**' or '*'

p input_string.gsub(/\*\*(.*)\*\*/, "<strong\\1</strong>" )

#end
