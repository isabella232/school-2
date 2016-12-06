module ApplicationHelper
  def root_page
    Refinery::Page.find_by(link_url: '/')
  end
  
  def last_blog_posts(count)
    Refinery::Blog::Post.order('created_at DESC').take(count)
  end  
end
