class BlogController < ApplicationController
  def index
    @articles = BlogController.get_meta
  end

  def article
    render params[:any].to_sym
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
end
