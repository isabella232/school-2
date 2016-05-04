module ApplicationHelper
  def root_page
    Refinery::Page.find_by(link_url: '/')
  end
end
