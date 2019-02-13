class Scraping
  def self.get_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://www.allnightnippon.com/kw/")
    elements = current_page.search('.gallery-footer ul li a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_product(link)
    end
  end

  def self.get_product(link)
    agent     = Mechanize.new
    page      = agent.get(link)
    title     = page.at('.sp_title').inner_text
    date      = page.at('.blog_day-area h4').inner_text.to_s
    url       = page.at('.blog_text-area img')[:src]
    image_url = "http://www.allnightnippon.com" + url

    product = Product.new(title: title, date: date, image_url: image_url, link: link)
    product.save
  end
end