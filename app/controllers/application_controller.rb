require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do
      erb :super_hero
    end

    post "/teams" do
      @team_name = params[:team]["name"]
      @team_motto = params[:team]["motto"]
      Team.new(@team_name, @team_motto)

      params[:team]["heroes"].each do |hero|
        Hero.new(hero["name"], hero["power"], hero["bio"])
      end 
      @heroes = Hero.all
      erb :team


    end
end
