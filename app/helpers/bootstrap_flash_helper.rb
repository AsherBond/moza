module BootstrapFlashHelper  
  def bootstrap_flash
   flash_messages = []
   flash.each do |type, message|
     type = :success if type == :notice
     type = :error   if type == :alert
     text = content_tag(:div, link_to("<i class='icon-remove-sign'></i>".html_safe, "#", :class => "close", "data-dismiss" => "alert") + message, :class => "alert alert-top fade in alert-#{type}")
     flash_messages << text if message
   end
   flash_messages.join("\n").html_safe
 end
end