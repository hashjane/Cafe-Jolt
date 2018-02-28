module LinksHelper
  def generate_links menu_links
    if menu_links.include?("prev")
      links = link_to "<< Previous", menu_links["prev"]["href"], class: 'badge badge-success'
    end

    if menu_links.include?("next")
      links = link_to "Next >>", menu_links["next"]["href"]
    end

    links
  end
end
