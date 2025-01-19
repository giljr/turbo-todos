
# Project: Turbo Todos

Turbo Todos is a simple To-Do List application built with Rails 7 and Tailwind CSS. This app demonstrates the use of Turbo Streams for dynamic, real-time updates without requiring full-page reloads.

---

## Features

- Dynamic creation of todos using Turbo Streams.
- Inline editing of todos with Turbo Frames.
- Real-time updates for improved user experience.
- Built with Rails 7 and styled with Tailwind CSS.

---

## Getting Started

### Prerequisites
Ensure you have the following installed:
- Ruby 3.1+
- Rails 7.0+
- Node.js
- Yarn or npm
- PostgreSQL (or your preferred database)

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/giljr/turbo-todos.git
   cd turbo-todos

Install dependencies:

    bundle install

Create and migrate the database:

    rails db:create db:migrate

Start the server:

    bin/dev

Visit http://localhost:3000 to see the app running.

Usage:

Adding Todos

    Use the input form on the homepage to add new todos. 
    The list updates dynamically using Turbo Streams.

Editing Todos

    Click on a todo item to edit it inline. 
    Changes are updated dynamically without a page refresh.

Key Code Changes

Migration

Default status set in migration:

```class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
```
Turbo Stream Partial

Dynamically update the list and form:
```
<%= turbo_stream.prepend "todos" do %>
  <%= render "todo", todo: @todo %>
<% end %>
<%= turbo_stream.replace "#{dom_id(Todo.new)}_form" do %>
  <%= render "form", todo: Todo.new %>
<% end %>
```
Inline Editing with Turbo Frames

Edit todos directly:
```
<li id="<%= "#{dom_id(todo)}_item" %>" class="py-3">
  <%= turbo_frame_tag dom_id(todo) do %>
    <%= link_to todo.title, edit_todo_path(todo) %>
  <% end %>
</li>
```
Validation

Ensure todos have a title:
```
class Todo < ApplicationRecord
  validates :title, presence: true
end
```
Handle errors dynamically:
```
format.turbo_stream { render turbo_stream: turbo_stream.replace("#{dom_id(@todo)}_form", partial: "form", locals: { todo: @todo }) }
```
Tailwind CSS Integration

The app uses Tailwind CSS for styling, installed via Rails:

    rails new turbo-todos -c tailwind

## Screenshots

![App Screenshot](/public/todo.png)

Contributing

Feel free to submit issues or pull requests.
License

This project is licensed under the MIT License.



## License

This project is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License

