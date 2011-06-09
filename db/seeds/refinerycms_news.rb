if defined?(::User)
  User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_news').blank?
      user.plugins.create(:name => 'refinerycms_news',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(::Page)
  unless Page.where(:menu_match => "^/news.*$").any?
    page = Page.create(
      :title => "News",
      :link_url => "/news",
      :deletable => false,
      :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
      :menu_match => "^/news.*$"
    )

    Page.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
  unless Page.where(:menu_match => "^/articles.*$").any?
    page = Page.create(
      :title => "Articles",
      :link_url => "/articles",
      :deletable => false,
      :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
      :menu_match => "^/articles.*$"
    )

    Page.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
  unless Page.where(:menu_match => "^/recipes.*$").any?
    page = Page.create(
      :title => "Recipes",
      :link_url => "/recipes",
      :deletable => false,
      :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
      :menu_match => "^/recipes.*$"
    )

    Page.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
end
