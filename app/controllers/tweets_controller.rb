class TweetsController < ApplicationController
    def index
        # Se mostraran los tweets ordenados por fecha de creacion
        @tweets = Tweet.all.order(created_at: :desc)
    end

    def show   
        # Se muestra el tweet :id
        tweet
    end

    # Se usa para renderizar el form y usar una instancia vacia del record
    def new
        @tweet = Tweet.new
    end

    def create
        # Se crea un tweet con los strong params
        @tweet = Tweet.new(tweets_params)
        
        # Si se pudo crear se muestra
        if @tweet.save 
            # Se muestra el tweet
            redirect_to @tweet, notice: "Tweet creado."
        else
            # Se renderizo el new.html.erb
            render :new
        end
    end

    private
    # Defino strong params
    # solo se permite usar los parametros aqui definidos
    def tweets_params
        params.require(:tweet).permit(:content, :monster_id)
    end

    def tweet
        # Si esta seteado no hace nada sino lo va a buscar
        @tweet ||= Tweet.find(params[:id])
      end
end