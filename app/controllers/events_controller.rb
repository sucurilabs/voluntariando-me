class EventsController < ApplicationController
  inherit_resources
  include EventsHelper
  before_filter :is_logged?, :except => [:index, :show, :participants]
  before_filter :is_admin?, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.by_localization(params[:localization_id]).page(params[:page]).per(10)
  end

  def create
    params[:event].merge!(:owner_id => current_user.id)
    create!
  end

  def join
    @join = Event::Join.new(:event_id => params[:id], :user_id => current_user.id)
    @event = @join.event
    if @join.save
      message = t("events.join_success")
    else
      message = t("events.join_error")
    end
    render :json => {:html => toggle_join_event, :message => message}
  end

  def leave
    @join = current_user.joins.find_by_event_id(params[:id])
    @event = @join.event
    if @join.try(:destroy)
      message = t("events.leave_success")
    else
      message = t("events.leave_error")
    end
    render :json => {:html => toggle_join_event, :message => message}
  end

  def participants
    event = Event.find(params[:id])
    participants = event.participants_by_join_date
    response = {:modal_header => t('events.participants'), :modal_body => "<ul>"}
    participants.each do |participant|
      response[:modal_body] << "<li>#{participant.email}</li>"
    end
    response[:modal_body] << "</ul>"
    render :json => response
  end

  protected
    def is_logged?
      unless current_user
        flash[:error] = t('view_errors.not_logged')
        redirect_to root_path
      end
    end
    
    def is_admin?
      unless current_user.admin?
        flash[:error] = t('view_errors.not_admin')
        redirect_to root_path
      end
    end

end