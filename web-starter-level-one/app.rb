# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "todo_list"

class WebApplicationServer < Sinatra::Base
  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader
  end

  before do
    # This sets up the right content type for plain text responses
    content_type 'text/plain'

    # This sets up the global data store. You will use this for your data model.
    # In future you will use a database instead.
    $global ||= {}
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

get '/todos' do
  if todo_list.list.empty?
    return "You have no tasks to do.\n"
  else 
    formatted_tasks = todo_list.list.map.with_index do |task, idx| 
      "#{idx + 1}. #{task}"
    end
    p formatted_tasks
    return formatted_tasks.join("\n") + "\n"
  end
end

post '/todos' do
  todo_list.add(params[:task])
  return "You have added a task.\n"
end

get '/todos/1' do
  if todo_list.list.empty?
    return "You have no tasks to do.\n"
  else 
    formatted_tasks = todo_list.list.map.with_index do |task, idx| 
      "#{idx + 1}. #{task}"
    end
    p formatted_tasks
    return formatted_tasks.join("\n") + "\n"
  end
end

  # This is an example of setting up a new instance using the global data store.
def todo_list
  $global[:todo_list] ||= TodoList.new
end

  # EXAMPLE ROUTES

  # Try: `curl localhost:9292/example`
  get '/example' do
    return "This is an example response.\n"
  end

  # Try: `curl -X POST -d "hello=world&happy=days" localhost:9292/example`
  post '/example' do
    output = "Thanks for the POST request to /example.\n\n"
    output += "Your params were:\n"
    output += params.to_s
    output += "\n\nTry changing the request and see what happens.\n"
    return output
  end

  # Try: `curl -X PATCH -d "hello=world&happy=days" localhost:9292/example/99`
  patch '/example/:id' do
    output = "Thanks for the PATCH request to /example/#{params[:id]}.\n\n"
    output += "Your params were:\n"
    output += params.to_s
    output += "\n\nSee how the `:id` in the URL got into that list?\n"
    output += "Try changing the request and see what happens.\n"
    return output
  end

  # Try: `curl -X DELETE localhost:9292/example/99`
  delete '/example/:id' do
    output = "Thanks for the DELETE request to /example/#{params[:id]}.\n\n"
    output += "Your params were:\n"
    output += params.to_s
    output += "\n\nTry changing the request and see what happens.\n"
    return output
  end
end
