require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

class HtmlRenderer < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def initialize(options = {})
    super(options)
  end
end
