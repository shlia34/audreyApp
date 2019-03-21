class Scraping
  def self.get_urls_a
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://www.allnightnippon.com/kw/")
    elements = current_page.search('.gallery-footer ul li a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_product_a(link)
    end
  end

  def self.get_product_a(link)
    agent     = Mechanize.new
    page      = agent.get(link)
    title     = page.at('.sp_title').inner_text
    date      = page.at('.blog_day-area h4').inner_text.to_s
    url       = page.at('.blog_text-area img')[:src]
    image_url = "http://www.allnightnippon.com" + url

    product = Product.where(title: title, date: date, image_url: image_url, link: link).first_or_initialize
    product.save
  end


   def self.get_urls_b
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://www.allnightnippon.com/kw_past/backnumber.php")
    elements = current_page.search('.title h2 a')
    elements.each do |ele|
      link = ele.get_attribute('href').sub(/./, 'http://www.allnightnippon.com/kw_past')
      links << link
    end

    links.each do |link|
      get_product_b(link)
    end
  end

  def self.get_product_b(link)
    agent     = Mechanize.new
    page      = agent.get(link)
    title     = page.at('.title h2').inner_text
    date      = page.at('.date').inner_text.to_s
    if page.at('.articleImg img')
      url       = page.at('.articleImg img')[:src]
      image_url = "http://www.allnightnippon.com" + url
    end

    product = Product.where(title: title, date: date, image_url: image_url, link: link).first_or_initialize
    product.save
  end

end

