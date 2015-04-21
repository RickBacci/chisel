require './test/test_helper'

class ChiselTest < Minitest::Test

  def setup
    input = './test/test_io_files/test_input_file.markdown'
    output = '.test/test_io_files/test_output_file.html'
    @markdown = '# Hello world'
    @chisel = Chisel.new(input, output, @markdown)
  end

  def test_we_have_a_chisel
    chisel = Chisel.new('in', 'out', @markdown)
    assert chisel
  end

  def test_that_chisel_can_take_two_files
    chisel = Chisel.new('in', 'out', @markdown)
    assert_equal 'in', chisel.input_file
    assert_equal 'out', chisel.output_file
  end

  def test_that_chisel_can_build_html_file
   # assert_equal '<h1>Input test file</h>',@chisel.build_html
  end

end


