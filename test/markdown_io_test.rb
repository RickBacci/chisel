require 'minitest/autorun'
require 'pry'
require './lib/markdown_io'

class MarkdownIoTest < MiniTest::Test

  def test_program_can_open_a_file_and_read_a_line
    file = IO.readlines('./test/test_io_files/test_reader.txt')
    assert_equal ["Testing Reader\n"],file
  end

  def test_program_can_read_multiple_lines
      file = File.readlines('./test/test_io_files/test_multiple.txt')
    output = ["line1\n", "\n", "line2\n"]
    assert_equal output,file
  end

  def test_markdown_io_can_read_a_file
    test_file = './test/test_io_files/test_multiple.txt'
    markdown = MarkdownIO.read_markdown(test_file)
    output = ["line1\n", "\n", "line2\n"]
    assert_equal output, markdown
  end

  def test_markdown_io_can_read_required_file
    input_file = 'my_input.markdown'
    markdown = MarkdownIO.read_markdown(input_file)

    output =
      [
        "# My Life in Desserts\n",
        "\n",
        "## Chapter 1: The Beginning\n",
        "\n",
        "\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n",
        "**Food & Wine** this place has been packed every night.\"\n"
      ]
    assert_equal output, markdown
  end


  def test_markdown_io_can_write_a_file
    output_file = './my_output.html'

    html =
      %{
<h1>My Life in Desserts</h1>

<h2>Chapter 1: The Beginning</h2>

<p>
  "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
  <strong>Food &amp; Wine</strong> this place has been packed every night."
</p>
}
    write_test = MarkdownIO.write_html(output_file, html)

    assert write_test
  end
end

