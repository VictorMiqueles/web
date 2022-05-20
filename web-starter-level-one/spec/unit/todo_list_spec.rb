require "todo_list"

RSpec.describe TodoList do
    it "adds a todo" do
        todo_list = TodoList.new
        todo_list.add("Walk the dog")
        expect(todo_list.list).to eq [
            "Walk the dog"
        ]
    end


end

