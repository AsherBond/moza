module ApplicationHelper
	include BootstrapPageHeaderHelper
	include IsMeHelper

	def phit size
		"http://placehold.it/#{size}"
	end

	def text_list(listtext,sep1=", ", sep2=", and ")
	  n = listtext.size
	  if n > 1
	  	(listtext.first(n-1)).join(sep1) + sep2 +listtext.last 
	  else 
	  	listtext.first 
	  end
	end

	def parse_youtube url
		regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
		url.match(regex)[1]
	end

	def button_link icon, title, url, classes=nil
		link_to "<i class='icon-#{icon} icon-large'></i> #{title}".html_safe, url, :class => "btn #{classes}"
	end

	def icon_link icon, title, url, classes=nil
		link_to "<i class='icon-#{icon}'></i> #{title}".html_safe, url, :class => "#{classes}"
	end
end
