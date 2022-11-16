class EventsController < ApplicationController
    def index
        @events = Event.where(validated: true)
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(
            title: params[:title],
            description: params[:description],
            price: params[:price],
            admin: current_user,
            location: params[:location],
            start_date: params[:start_date],
            duration: params[:duration]
        )
  
        if @event.save
            redirect_to :root
        else 
            render :new
        end
    end
end
