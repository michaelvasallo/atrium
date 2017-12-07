class PagesController < ApplicationController
  def about
    load_page 'about'
  end

  def contact
    load_page 'contact'
  end

  private

  def load_page(title)
    page = Page.find_by(title: title)
    @page_title = page.title.capitalize
    @content = page.content
  end
end
