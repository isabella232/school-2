module ApplicationHelper
  def root_page
    Refinery::Page.find_by(link_url: '/')
  end
  
  def root_galleries
    Refinery::Portfolio::Gallery.where(depth: 0)
  end  
end
