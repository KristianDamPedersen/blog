module Converters
  ##
  # This class handles converting Markdown to HTML.
  class MarkdownToHtml
    TEMPLATE_CONTENT= <<-HTML
    <div>
      ${content}
      <h1>Test</h1>
    </div>
    HTML

    ##
    # Converts markdown to html using the provided template?
    def call(template, source)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

      # Remove front matter from markdown
      sanitized_source = source.gsub(/---([\S\s]*)---/, "").strip

      html = TEMPLATE_CONTENT.gsub("${content}", markdown.render(sanitized_source))

      "#{html.inspect}.html_safe"
    end
  end
end
