module BootstrapPageHeaderHelper  
	def bootstrap_page_header title, support=nil
		content_tag(:div, "<h1>#{title} <small>#{support}</small></h1>".html_safe, :class => "page-header")
	end
end