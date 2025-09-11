class BlogController < ApplicationController
  def index
    @articles = BlogController.get_meta
  end

  def article
    slug = params[:any]
    if BlogController.slugs.include?(slug)
      safe_slug = BlogController.get_meta.select { |meta| File.basename(meta[:url]) == slug }[0][:url]
      render "#{safe_slug}"
    else
      raise ActionController::RoutingError, "Not found"
    end
  end

  ##
  # Gets all the front matter meta data from the blog posts
  def self.get_meta
    blog_folder = Rails.root.join("app/views/blog")

    Dir.children(blog_folder)
      .select { |f| f.ends_with?(".md") }
      .map do |filename|
        fm = FrontMatterParser::Parser.parse_file("#{blog_folder}/#{filename}").front_matter
        fm.merge!(url: "/blog/#{filename.delete_suffix(".md")}")
        fm.with_indifferent_access
      end
  end

  def self.slugs
    get_meta.map { |meta| File.basename(meta[:url]) }
  end
end
