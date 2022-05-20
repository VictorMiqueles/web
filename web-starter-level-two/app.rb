# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "animal_list"
require "board"
require "advert_post"

class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride

  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader
  end

  before do
    # This sets up the global data store. You will use this for your data model.
    # In future you will use a database instead.
    $global ||= {}
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

  get '/board' do
    erb :board_index, locals: {
      adverts: board().adverts
    } 
  end

  get '/board/new' do
    erb :board_new
  end

  post '/board' do
    advert_post = AdvertPost.new(params[:number], params[:description])
    board.add(advert_post)
    redirect "/board"
  end

  delete "/board/:index" do
    board.remove(params[:index].to_i)
    redirect "/board"
  end

  get "/board/:index/edit" do
    erb :board_edit, locals: {
      index: params[:index].to_i,
      entry: board.get(params[:index].to_i)
    }
  end 

  #patch 

  def board
    $global[:board] ||= Board.new
  end

  # This is an example of setting up a new instance using the global data store.
  # def your_data_model
  #   $global[:your_data_model] ||= YourDataModel.new
  # end

  # EXAMPLE ROUTES

  get '/animals' do
    erb :animals_index, locals: { animals: animal_list.list }
  end

  get '/animals/new' do
    erb :animals_new
  end

  post '/animals' do
    animal_list.add(params[:species])
    redirect '/animals'
  end

  delete '/animals/:index' do
    animal_list.remove(params[:index].to_i)
    redirect '/animals'
  end

  get '/animals/:index/edit' do
    animal_index = params[:index].to_i
    erb :animals_edit, locals: {
      index: animal_index,
      animal: animal_list.get(animal_index)
    }
  end

  patch '/animals/:index' do
    animal_index = params[:index].to_i
    animal_list.update(animal_index, params[:species])
    redirect '/animals'
  end

  def animal_list
    $global[:animal_list] ||= AnimalList.new
  end
end
