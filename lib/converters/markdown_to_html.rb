module Converters
  ##
  # This class handles converting Markdown to HTML.
  class MarkdownToHtml
    TEMPLATE_CONTENT= <<-HTML
      %%CONTENT%%
      <h1 class="text-fg">Test</h1>
    HTML

    ##
    # Converts markdown to html using the provided template?
    def call(template, source)
      markdown = Redcarpet::Markdown.new(
        HtmlRenderer,
        {
          fenced_code_blocks: true,
          tables: true,
          autolink: true,
          highlight: true,
          quote: true
        }
      )

      # Remove front matter from markdown
      sanitized_source = source.gsub(/---([\S\s]*)---/, "").strip

      rendered_markdown = markdown.render(sanitized_source)

      html = TEMPLATE_CONTENT.gsub("%%CONTENT%%", rendered_markdown)

      html.html_safe
    end
  end
end
