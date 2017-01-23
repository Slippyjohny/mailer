class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:due]
      time=params[:due]
      @events = current_user.events.search_everywhere(time)
      @attached = current_user.attached_events.search_everywhere(time)
    elsif params[:interval]
      interval=params[:interval].scan(/\d/).join('').to_i
      @events = current_user.events.where(created_at: (Time.now- interval.day)..Time.now)
      @attached = current_user.attached_events.where(created_at: (Time.now - interval.day)..Time.now)
    else
      @events = current_user.events
      @attached = current_user.attached_events
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.events.create(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:place, :time, :description, :end_time)
  end
end
