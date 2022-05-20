# Todo List Web Design Recipe (Level One)

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

A. I want an application where I can keep my Todo List
B. I want to be able to list, add, update, delete tasks from the list (CRUD)


## 2. Design the Data Model Class

_This class should store and manage the data the server will hold._
_Include the initializer and public methods with all parameters and return values._

```ruby

class TodoList
  def initialize
  end

  def list
    # returns a list of strings representing tasks
  end

  def add(tasks) # task is a string
    # Returns nothing
    # Adds the task to the list
  end

  def get(index) # index is a number (index in the todo list)
    # Returns the task at index
  end

  def remove(index) # Index is a number (index in the todo list)
    # Returns nothing
    # Removes the task at index from the list
  end

  def update(index, new_task)
    # Index is a number (index in the todo list)
    # new_task is a string
    # Returns nothing
    # Replaces the task at the given index with the new_task text
  end

end







```

_Check it against these rules:_

> 1. Does it represent a collection (list or hash) of data? - Yes
> 2. Does it _at least_ have methods to:
>    1. List out all items in the resource - Yes
>    2. Create an item (C) - Yes
>    3. Get a single item (R) - Yes
>    4. Update an item (U) - Yes
>    5. Delete an item (D) - Yes
> 3. Does each method take only simple data types as arguments? - Yes
>    Simple data types are: string, number, boolean.  
>    Methods can return lists, hashes & other objects, but not take them as
>    parameters.
> 
> Some of these rules will be relaxed later but will keep you safe for now.

## 3. Design the Web API (Requests)

_Design requests that perform each of the operations on your model class._
_Map them to the methods in your class._

```ruby
# EXAMPLE

todo_list = TodoList.new

# GET /todos
todo_list.list 

# GET /todos/:id
todo_list.get(id)

# POST /todos
# With data: task = walk the dog
todo_list.add(task)

# PATCH /todos/:id
# With data: task = walk the cat
todo_list.update(id, task)

# DELETE /todos/:id
todo_list.remove(id)

```

> Remember:
> GET: Getting a single item or a list of items
> POST: Adding an item
> PATCH: Updating an item
> DELETE: Deleting an item

## 4. Create Examples

_Create examples of the requests and their responses in different scenarios._

```ruby

# 1 - Listing out an empty todo list - PASSED
Request: GET /todos
Response: 
  """
  You have no tasks to do.
  """

# 2 - Adding a task and listing out the tasks
Request: POST /todos
  With data: task = walk the dog
Response: 
  """
  You have added a task.
  """
Request: GET /todos
Response: 
  """
  1. Walk the dog
  """

# 3 - Adding a task and getting that task individually
Request: POST /todos
  With data: task = walk the dog

Request: GET /todos/1
Response: 
  """
  1. Walk the dog
  """

# 4 - Adding multiple tasks and listing out the tasks
Request: POST /todos
  With data: task = walk the dog
Request: POST /todos
  With data: task = walk the cat
Request: POST /todos
  With data: task = walk the frog

Request: GET /todos
Response: 
  """
  1. walk the dog
  2. walk the cat
  3. walk the frog
  """

# 5 - Adding multiple tasks, deleting one, and listing out the tasks
Request: POST /todos
  With data: task = walk the dog
Request: POST /todos
  With data: task = walk the cat
Request: POST /todos
  With data: task = walk the frog
Request: DELETE /todos/2 
Response: 
  """
  you have deleted a task.
  """

Request: GET /todos
Response: 
  """
  1. walk the dog
  2. walk the frog
  """

# 6 - Adding multiple tasks, updating one, and listing out the tasks
Request: POST /todos
  With data: task = walk the dog
Request: POST /todos
  With data: task = walk the cat
Request: POST /todos
  With data: task = walk the frog
Request: PATCH /todos/2 
  With data: task = walk the zebra
Response: 
  """
  you have updated a task.
  """

Request: GET /todos
Response: 
  """
  1. walk the dog
  2. walk the zebra
  3. walk the frog
  """

```

## 5. Translate the Examples to Web Tests

_Translate your examples to tests using `Rack::Test`_

```ruby
# EXAMPLE

RSpec.describe "Todo Application" do
  it "gets an empty list of todos" do
    get "/todos"
    expect(last_response.body).to eq "You have nothing to do."
  end
end
```

## 6. Implement the Behaviour

_Follow this cycle:_

1. Add a web test in `/spec/web/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.


## 7. Victor Notes

Design Data Model Class Example

class TodoList
  def initialize
  end

  def all
    # Returns a list of strings
  end

  def add(task) # task is a string
    # No return value
  end

  def get(index) # index is a number
    # Returns a string, the task at the given index
  def

  def update(index, new_task) # index is a number, new_task is a string
    # Updates the task at index to be the text new_task
    # No return value
  end

  def remove(index) # index is a number
    # Deletes the task at index
  end
end
```

Web API example

# Request: GET /todos
todo_list.all

# GET /todos/:index
todo_list.get(index)

# POST /todos
# With data: { task: "Walk the dog" }
reminder.add(task)

# PATCH /todos/:index
# With data: { task: "Walk the cat" }
reminder.update(index, task)

# DELETE /todos/:index
reminder.remove(index)

```ruby


Create Examples

# EXAMPLE

# 1 - Getting an empty list of todos
Request: GET /todos
Response: """
You have nothing to do.
"""

# 2 - Adding a todo and listing it
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: GET /todos
  Response: """
  1. Walk the dog
  """

# 3 - Adding multiple todos and listing them
Request: POST /todos
   Data: { task: "Walk the dog" }
Request: POST /todos
   Data: { task: "Walk the cat" }
Request: POST /todos
   Data: { task: "Walk the frog" }
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the cat
  3. Walk the frog
  """

# 3 - Adding multiple todos, deleting one, and listing them
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: POST /todos
  Data: { task: "Walk the cat" }
Request: POST /todos
  Data: { task: "Walk the frog" }
Request: DELETE /todos/2
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the frog
  """

# 3 - Adding multiple todos, updating one, and listing them
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: POST /todos
  Data: { task: "Walk the cat" }
Request: POST /todos
  Data: { task: "Walk the frog" }
Request: PATCH /todos/2
  Data: { task: "Walk the zebra" }
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the zebra
  2. Walk the frog
  """
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
