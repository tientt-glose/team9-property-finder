module PostsHelper
    def post_thumbnail_url post
        post.image.present? ? post.image.url : "placeholder.jpg" 
    end
end
