module ApplicationHelper
	include BootstrapPageHeaderHelper

	def button_link icon, title, url, classes=nil
		link_to "<i class='icon-#{icon}'></i> #{title}".html_safe, url, :class => "btn #{classes}"
	end

	def icon_link icon, title, url, classes=nil
		link_to "<i class='icon-#{icon}'></i> #{title}".html_safe, url, :class => "#{classes}"
	end
end
