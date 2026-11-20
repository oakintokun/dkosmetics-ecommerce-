class PagesController < ApplicationController
  def about
    @page = SitePage.find_by!(slug: "about")
  end

  def contact
    @page = SitePage.find_by!(slug: "contact")
  end
end