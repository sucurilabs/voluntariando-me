module ApplicationHelper
  
  def facebook_app_id
    "347600791981595"
  end

  # def facebook_url
  #   "https://www.facebook.com/dialog/feed"
  # end

  # def caption
  #   "Voluntariando.Me"
  # end

  # def url_share
  #   "#{request.host_with_port}/#{url_for}"
  # end

  # def url_button(options)
  #   "#{facebook_url}?
  #   app_id=#{app_id}&
  #   link=#{url_share}&
  #   caption=#{caption}&
  #   redirect_uri=#{url_share}
  #   #{options}"
  # end

  # def share_button(options)
  #   link_to t('facebook_share'), url_button(options)
  # end

  # def share_event_button(event)
  #   share_button("name=#{event.name}&description=#{event.description}&picture=#{event.cover.url(:thumb)}")
  # end

end
