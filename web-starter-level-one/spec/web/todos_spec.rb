RSpec.describe "Todo list Web Resources" do
    it "Lists out an empty todo list" do
      get "/todos"
      expect(last_response.body).to eq(
          "You have no tasks to do.\n"
      )
    end

    it "Adds a task and lists out the task" do
      post "/todos", task: "Walk the dog"
      expect(last_response.body).to eq(
          "You have added a task.\n"
      )

      get "/todos" 
      expect(last_response.body).to eq(
          "1. Walk the dog\n"
      )

    end

end 