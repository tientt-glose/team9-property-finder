module ApplicationHelper

    def profile_picture account, width = 100
        thumb = account.image.present? ? account.image.url : "placeholder.jpg"

        image_tag thumb, width: width, class: "profile-pic img-circle"
    end

    def flash_notification
        flash_message = []

        flash.each do |type, message|
            type = 'sucess' if type == 'notice'
            type = 'error' if type == 'alert' || type == 'danger'
            text = "toastr['#{type}']('#{message}');"
            flash_message << text.html_safe unless message.blank?
        end

        "<script>$(function(){ #{ flash_message.join("\n") } });</script>".html_safe if flash_message.any? 
    end
end
