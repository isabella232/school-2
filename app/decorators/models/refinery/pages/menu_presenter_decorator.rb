Refinery::Pages::MenuPresenter.class_eval do
  self.list_tag_css = 'nav-pills mainmenucontain container'

  private

  def render_menu(items)
    content_tag(menu_tag, class: 'subnav') do
      content_tag(:div, class: 'container menurelative') do
        render_menu_items(items, true)
      end
    end
  end

  def render_menu_items(menu_items, top_level)
    if menu_items.present?
      content_tag(list_tag, class: top_level ? list_tag_css : '') do
        menu_items.each.inject(ActiveSupport::SafeBuffer.new) do |buffer, item|
          buffer << render_menu_item(item)
        end
      end
    end
  end

  def render_menu_item(menu_item)
    content_tag(list_item_tag) do
      buffer = ActiveSupport::SafeBuffer.new
      buffer << render_menu_item_link(menu_item)
      unless menu_item_children(menu_item).empty?
        buffer << content_tag(:div) do
          render_menu_items(menu_item_children(menu_item), false)
        end
      end
      buffer
    end
  end

  def render_menu_item_link(menu_item)
    link_to(
      menu_item.title,
      context.refinery.url_for(menu_item.url),
      class: link_tag_css(menu_item)
    )
  end

  def link_tag_css(menu_item)
    css = []
    css << active_css if descendant_item_selected?(menu_item)
    css << active_css if selected_item?(menu_item)
    css.reject(&:blank?).presence
  end
end
