


class HtmlBlockItems
  attr_accessor :markdown

  def initialize(markdown)
    @markdown = markdown.split("\n\n")
    @chunks = markdown.split("\n\n")
  end

  def process_block_items
    generate_unordered_list
  end

  def generate_unordered_list
   #binding.pry
    @markdown = @chunks.map do |chunk|
      if chunk.match(/^\* (.*)/).nil?
        chunk
      else
        chunk = "<ul>" + chunk.gsub(/^\* (.*)/, "  <li>\\1</li>") + "\n</ul>"
      end
      chunk
    end.join("\n\n")
  end
end






  # def generate_ordered_list
  #   if @markdown.match(/^\d+\. (.*)/).nil?
  #     @markdown
  #   else
  #     @markdown = @markdown.gsub(/^\d+\. (.*)/, "  <li>\\1</li>")
  #   end
  #   return @markdown
  # end
