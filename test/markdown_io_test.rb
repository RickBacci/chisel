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

    output = "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n\"You just *have* to try the cheesecake,\" he said. \"Ever since it appeared in\n**Food & Wine** this place has been packed every night.\"\n\n\n* whatever\n* i'm tired.\n* deal with it.\n\n1. yeah\n2. i'm slow\n3. pizza\n\n\n\nThis is [an example](http://example.com/ \"Title\") inline link.\n\n[This link](http://example.net/) has no title attribute.\n\n"

    assert_equal output, markdown
  end


  def test_markdown_io_can_write_a_file
    input_file = './test/test_io_files/test_input_file.markdown'
    output_file = './test/test_io_files/test_output_file.html'

    hello = '<h1>Hello World</h1>'

    write_test = MarkdownIO.write_html(input_file, output_file, hello)
    assert '<h1>Hello World</h1>', MarkdownIO.read_markdown(output_file)
  end

  def test_write_html_returns_proper_response

    input_file = './test/test_io_files/test_input_file.markdown'
    output_file = './test/test_io_files/test_output_file.html'
    markdown_file = "# Input test file"


    result_of_write = "\n\nConverted ./test/test_io_files/test_input_file.markdown (1 lines) to ./test/test_io_files/test_output_file.html (1 lines)"
    html = "<h1>Hello World</h1>"

    result = MarkdownIO.write_html(input_file, output_file, html)

    assert_equal result_of_write, result
  end
end
