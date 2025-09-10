require "converters/markdown_to_html"

ActionView::Template.register_template_handler(:md, Converters::MarkdownToHtml.new)
