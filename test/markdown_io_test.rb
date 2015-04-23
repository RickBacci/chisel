require './test/test_helper'

class MarkdownIoTest < MiniTest::Test

  def test_markdown_io_can_read_a_file
    test_file = './test/test_io_files/test_reader.txt'
    markdown = MarkdownIO.read_markdown(test_file)
    output = "Testing Reader\n"
    assert_equal output, markdown
  end

  def test_markdown_io_can_read_required_file
    input_file = 'my_input.markdown'
    markdown = MarkdownIO.read_markdown(input_file)
    output =
      '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."
'
    assert_equal output, markdown
  end


  def test_markdown_io_can_write_a_file
    input_file = './test/test_io_files/test_input_file.markdown'
    output_file = './test/test_io_files/test_output_file.html'

    blah = '<h1>Hello World</h1>'

    write_test = MarkdownIO.write_html(input_file, output_file, blah)
    assert '<h1>Hello World</h1>', MarkdownIO.read_markdown(output_file)
  end
end




#
#
# html =
#   %{
# <h1>My Life in Desserts</h1>
#
# <h2>Chapter 1: The Beginning</h2>
#
# <p>
#   "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
#   <strong>Food &amp; Wine</strong> this place has been packed every night."
# </p>
# }
