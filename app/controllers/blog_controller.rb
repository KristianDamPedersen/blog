class BlogController < ApplicationController
  def index
    blog_folder = "app/views/blog"

    # Array<{ title:, description:, image:, url: }>
    @articles = Dir.new(blog_folder)
      .children
      .select { _1.ends_with?("md") }
      .map do |filename|
        fm = FrontMatterParser::Parser.parse_file("#{blog_folder}/#{filename}").front_matter
        fm.merge!(url: "blog/#{filename.gsub('.md', '')}")
        fm.with_indifferent_access
      end
  end

  def article
    render params[:any].to_sym
  end
end
