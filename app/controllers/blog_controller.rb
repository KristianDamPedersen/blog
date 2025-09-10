class BlogController < ApplicationController
  def index
    blog_folder = Rails.root.join("app/views/blog")

    @articles = Dir.children(blog_folder)
      .select { |f| f.ends_with?(".md") }
      .map do |filename|
        fm = FrontMatterParser::Parser.parse_file("#{blog_folder}/#{filename}").front_matter
        fm.merge!(url: "blog/#{filename.delete_suffix(".md")}")
        fm.with_indifferent_access
      end
  end

  def article
    render params[:any].to_sym
  end
end
