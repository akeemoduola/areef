# Areef

[![Coverage Status](https://coveralls.io/repos/github/andela-aoduola/areef/badge.svg?branch=master)](https://coveralls.io/github/andela-aoduola/areef?branch=master)
[![Circle CI](https://circleci.com/gh/andela-aoduola/areef.svg?style=svg)](https://circleci.com/gh/andela-aoduola/areef)

Areef is a simple Ruby + Rack powered web MVC framework. It is a Rails look alike but lightweight and very easy to use.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'areef'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install areef

## Usage

When creating a new Areef application, a few things need to be setup and a few rules adhered to. Areef follows the same folder structure as a typical rails app with all of the model, view and controller code packed inside of an app folder, configuration based code placed inside a config folder and the main database file in the root folder. [Here](https://github.com/andela-aoduola/areefTodolistApp.git) is a link to a Todolist app built using Areef with the correct folder setup, it can be forked, cloned and edited to suit other purposes.

# Understanding Areef

## Areef Controllers

Controllers are made up of methods often called actions, that are executed on request. It either renders a template or redirects to another action among many othe functions.

For an app using Areef, the controller class must follow the pattern below.

`ApplicationController` class inherits from `Areef::BaseController`.  Every other controller class inherits from `ApplicationController` e.g  `ListsController << ApplicationController`

```ruby
class ApplicationController < Areef::BaseController

end

class ListsController < ApplicationController
  def index
    @lists = List.all
  end
end
```

Actions, render template in the app/views folder corresponding to the name of the controller and action after executing code in the action.

For example, the index action of the `ListsController` would render the template `app/views/lists/index.html.erb` by default after populating the `@lists` instance variable.

Also controllers should be named in their pluralized form. Controllers would render its corresponding views without the `@lists` instance.

The `redirect_to` method redirects to the specified route


## Areef Models

Models are classes in the models folder. These classes are responsible for communications with the database.
All models should inherit from the `Areef::AreefRecord`. All model classes should be named as a singular object.

Example model class displaying available methods:

```ruby
class List < Areef::AreefRecord
  to_table :lists
  property :id, type: :integer, primary_key: true
  property :title, type: :text, nullable: false
  property :body, type: :text, nullable: false
  property :created_at, type: :text, nullable: false
  property :done, type: :boolean, nullable: false, default: false
  create_table
end
```

`to_table` This method is used to name the table in the database.

`property` This method is used to define the columns of a table in the database. As seen in the example above, the column type should also be defined on this method.

`created_table` This method triggers the main table creation.

## Areef Views

`Areef::BaseController` sends response to the views either by making use of render method declared within the controller method or by inferring the template to display from the name of the controllers. The render action looks for the corresponding views for every method in the controller. These files must be placed in a folder that has the same name as the controller.

The render method which enables rendering of ERB templates is automatically configured.
Objects can be passed from the controller to the view by either assigning them as instance variables or by passing the object as a parameter to the render method:

Having instance variable `@lists` makes `lists` object available to `views\lists\index.html.erb` and this is automatically rendered without explicitly calling the render method.

```ruby
def index
  @list = List.find(params["id"])
end
```

This method also renders the index template

```ruby
def index
end
```

## Parameters

All request parameters, whether they come from a GET or POST request, or from the URL, are available through the `params` method which returns a hash.

It's also possible to construct multi-dimensional parameter hashes by specifying keys using brackets, such as:

```html
<input type="text" name="list[title]" value="Title">
<input type="text" name="list[body]" value="Body">
```
The params can also be extracted into a private method such as `list_params`

```ruby
def list_params
  params[list]
end
```
## Routes

Routes are HTTP methods paired with a URL matching pattern, the first route that matches a request is invoked.
Route patterns may include named parameters, which can be gotten from the params hash:

They are defined in the file `config/routes.rb`

The `resources` makes available all the routes written below `resources :lists`
the `resources` method sets the default routes to the `index`, `new`, `edit`, `show`, `update`, `delete` controller methods.

Where `lists` is the name of the controller, and all words behind the `#` are action methods defined in your controller.

The `root` method is used to set the root path

```ruby

PostApplication.routes.draw do
  root "mypages#index"
  get "/all_posts", to: "posts#index"
  resources :posts
end
```

In the case of a request being made to an undefined route an error message is returned.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-aoduola/areef. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
