class EventsController < ApplicationController
  inherit_resources
  include EventsHelper
  before_filter :is_logged?, :except => [:index, :show]
  before_filter :is_admin?, :only => [:new, :create, :edit, :update, :destroy]

  def create
    params[:event].merge!(:owner_id => current_user.id)
    create!
  end

  def join
    @join = Event::Join.new(:event_id => params[:id], :user_id => current_user.id)
    @event = @join.event
    if @join.save
      message = t("events.join.success")
    else
      message = t("events.join.error")
    end
    render :json => {:html => toggle_join_event, :message => message}
  end

  def leave
    @join = current_user.joins.find_by_event_id(params[:id])
    @event = @join.event
    if @join.try(:destroy)
      message = t("events.leave.success")
    else
      message = t("events.leave.error")
    end
    render :json => {:html => toggle_join_event, :message => message}
  end

  protected
    def is_logged?
      unless current_user
        flash[:error] = t('errors.not_logged')
        redirect_to root_path
      end
    end
    
    def is_admin?
      unless current_user.admin?
        flash[:error] = t('errors.not_admin')
        redirect_to root_path
      end
    end

end