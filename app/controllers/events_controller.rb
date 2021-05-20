class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show] 

  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    @start_date = DateTime.strptime(params[:start_date],"%Y-%m-%d")
    @event = Event.create(
    start_date: @start_date,
    duration: params[:duration],
    title: params[:title],
    description: params[:description],
    price: params[:price],
    location: params[:location],
    admin: current_user
    )

    if @event.save
      redirect_to event_path(@event.id), alert: "Votre évènement est bien enregistrée !"
    else
      flash.now[:alert] = "Oups il y a eu une erreur, veuillez réessayer"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])

  end

  private

  def event_params
    params.permit(:start_date, :duration, :title, :description, :price, :location)
  end
end
