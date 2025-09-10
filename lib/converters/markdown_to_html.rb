module Converters
  ##
  # This class handles converting Markdown to HTML.
  class MarkdownToHtml
    ##
    # Converts markdown to html using the provided template?
    def call(template, source)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      "#{markdown.render(source).inspect}.html_safe"
    end
  end
end
