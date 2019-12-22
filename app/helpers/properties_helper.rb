module PropertiesHelper

    def property_thumbnail property
        img = property.photo.present? ? property.photo.url : "placeholder.jpg" 
        image_tag img, class: "prop-thumb"
    end

    def property_photo_url property
        property.photo.present? ? property.photo.url : asset_url("placeholder.jpg")
    end
end
