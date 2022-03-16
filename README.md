# Trello Like Application

This Trello-Like application is orginaly made for a test technique but it turned out finally into a side-project !

I used the following technologies:

- Rails
- VueJs
- Bootstrap
- PostgreSQL
- Gem Acts_as_list
- Gem Draggable

I've used Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# README

This is a Todo App musing Vue.js 3 and Rails 6.1.3.2.
This is a project to test Vue.Js 3

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## System dependencies

- Ruby version
  2.7.3

- Rails Version
  6.1.3.2

- PostgreSQL
  12.10

- Yarn Version
  v1.22.17

- Node Module version
  V16.11.1

- Webpacker 5
- Vue.js 3
- Bootstrap 5

# Stack

- [Ruby on Rails](https://rubyonrails.org/)
- [Bootstrap](https://getbootstrap.com/)
- [Vue.Js 3](https://vuejs.org/)
- [PostgreSQL](https://www.postgresql.org/)

# Local Development

## Installation

### Prerequisites

If you don't already have them :

- Install ruby 2.7.3 `rbenv install 2.7.3 && rbenv global 2.7.3`
- Install bundler 2.2.15 `gem install bundler:2.2.15`
- Install yarn `npm i -g yarn`

### Set up the repo

To install dependencies, run :

```bash
bundle install
yarn
```

To set up database, run:

```bash
rails db:setup
```

When running the `db:setup` command, the Database test and development will be created.
The User email and password to connect to the App will be display in the console and the seeds will be create.

### Set environment variables

Running the app locally requires 3 environment variables. To set up your environment variables, run the following command:

```bash
cp .env.template .env
```

Then, edit `.env` and set the following environment variables:

- `REDIS_DB`: This is Redis_db
- `REDIS_URL`: This is Redis URL
- `REDIS_PORT`: This is Redis Port

For more information, you can read "[ruby on rails redis installation and configuration](https://hixonrails.com/ruby-on-rails-tutorials/ruby-on-rails-redis-installation-and-configuration/)"
Or refer to the [Redis](documentation)

### Database / Cache

1. Create a database called `Todo_development` using your favorite postgresql GUI or CLI.
2. Then run the migrations : `bin/rails db:migrate RAILS_ENV=development`

### Start the server

To start both the frontend and backend servers at the same time, run:

```bash
bin/rails s
bin/webpack-dev-server
```

In your browser, navigate to localhost:3000 to see the app in action!

This may be helpful for debugging, but generally should not be necessary.

---

## Contributing 🤝

### 1. Assign yourself an issue from our [Issues](https://github.com/Isalafont/-Trello-like/issues) tab

- Check out the [`good first issue`](https://github.com/Isalafont/-Trello-like/labels/good%20first%20issue) tag if you're just getting started!
- If you want to work on something that isn't listed in our Issues, please [create a new issue](https://github.com/Isalafont/-Trello-like/issues/new).

### 2. Write your code and create a pull request

- Note that your pull request may require one or more tests. Tests are required for almost all backend changes, and all frontend logic-related changes. Style or copy changes do not require you to write a test.
- For a style or copy change, please provide side-by-side screenshots showing how the app looks before and after your changes.

## Contributor Resources 📚

Need some help contributing to our app? Check out the resources below for more information about installing and using various third-party tools.

### PostgreSQL

- Installing PostgreSQL: [Mac](https://www.onlinetutorialspoint.com/mac/how-to-install-postgresql-on-mac.html) • [Windows](https://www.postgresqltutorial.com/install-postgresql/) • [Linux](https://www.postgresqltutorial.com/install-postgresql-linux/)

### Ruby

- [Installing Ruby](https://github.com/rbenv/rbenv)

### Node

- [Installing Node](https://github.com/nvm-sh/nvm#installing-and-updating)
- [Installing Yarn](https://classic.yarnpkg.com/en/docs/install/)

### GitHub

- [Forking and cloning a repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
- [Working with forks](https://docs.github.com/en/github/collaborating-with-pull-requests/working-with-forks)
- [Creating and deleting branches](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository)
- [Commit guide](https://github.com/git-guides/git-commit)
- [Creating a pull request from a fork](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork)

## Reporting Issues 🐞

To report a bug or request a new feature, please [open an issue](https://github.com/Isalafont/-Trello-like/issues/new).
