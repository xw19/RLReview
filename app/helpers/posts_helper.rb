module PostsHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(no_intra_emphasis: true, hard_wrap: true, autolink: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, safe_links_only: true, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end


end
