module BootstrapPageHeaderHelper  
	def bootstrap_page_header title, support=nil
		content_tag(:div, "<h1 class='page-header-h1'>#{title} <small class='page-header-small'>#{support}</small></h1>".html_safe, :class => "page-header")
	end
end