require 'redcarpet'

## for accurately parsing markdown

renderer = Redcarpet::Render::HTML.new
markdown = Redcarpet::Markdown.new(renderer)
puts markdown.render('# zomg') # => "<h1>zomg</h1>\n"
