module EventsHelper
  
  def toggle_join_event(event = nil)
    @event ||= event
    if @event.has_user?(current_user.id)
      button = "<a href='#' onclick='eventToggle(\"#{leave_event_path(@event)}\", \"delete\")\'> #{t('events.leave')}</a>"
    else
      button = "<a href='#' onclick=\'eventToggle(\"#{join_event_path(@event)}\", \"post\")\'> #{t('events.join')}</a>"
    end
    button.html_safe
  end  

  def model_class
    Event
  end
  
end
