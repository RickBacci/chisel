require 'minitest/autorun'
require 'pry'
require './lib/markdown_io'

class MarkdownReaderTest < MiniTest::Test

  def test_program_can_open_a_file_and_read_a_line
    file = IO.readlines('./test/test_reader.txt')
    assert_equal ["Testing Reader\n"],file
  end

  def test_program_can_read_multiple_lines
      file = File.readlines('./test/test_multiple.txt')
    output = ["line1\n", "\n", "line2\n"]
    assert_equal output,file
  end

  def test_markdown_io_can_read_a_file
    test_file = './test/test_multiple.txt'
    markdown = MarkdownIO.read_markdown(test_file)
    output = ["line1\n", "\n", "line2\n"]
    assert_equal output, markdown
  end


end

