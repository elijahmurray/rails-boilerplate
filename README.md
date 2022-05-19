# TODO
- Setup modal system to use easily

*React setup (optional)*
```
bundle install
enable the gems for react and webpacker within Gemfile
rails webpacker:install
rails webpacker:install:react
rails generate react:install
```

*Application setup*
Install foreman

`gem install foreman`

Note: This does not go in your `Gemfile`

* Rename application
  `rails g rename:into My-App-Name`
* `cp .env.template .env`
* Rename your company_name in `config/locales/en.yml`
* Rename your database in `config/database.yml`
* `rake db:setup`
* `rails generate simple_form:install --bootstrap`



*Run:*
`foreman start`

* Services (job queues, cache servers, search engines, etc.)
For faster development, this application uses a livereloader plugin with Chrome. [Read more about it here](https://github.com/guard/guard-livereload). This is entirely optional.

*Deployment instructions*

Quick Start Heroku:

* `heroku apps:create myapp`
* `git push heroku`
* `heroku rake db:migrate`

*Setting up Production*

- Run `RAILS_ENV=production rake secret` to generate a secret token
- Edit the `.env` file and set SECRET_KEY_BASE="GENERATED_SECRET_TOKEN"

*React Getting Started*
Generate a component:

`rails g react:component HelloWorld greeting:string`

Load it:
```
<!-- application.html.erb in Head tag below turbolinks -->
<%= javascript_pack_tag 'application' %>
```

Render it:

```
<!-- erb: paste this in view -->
<%= react_component("HelloWorld", { greeting: "Hello from react-rails." }) %>
```

_source: https://github.com/reactjs/react-rails#5-generate-your-first-component_

*Custom domain*
To setup a custom domain with namecheap:

*Heroku*
- Under _Domains and certificates_ click Add domain
- Make sure domain includes www

*Namecheap*
- Set redirect:
`mydomain.tld -> www.mydomain.tld`

- Advanced DNS
`CNAME    |    www    |   xyz.herokudns.com.`
`URL Redirect Record    |    @    |    http://www.mydomain.tld    |   Unmasked`

- Set email catchall to your email

*SSL*
- Make sure you setup Namecheap catchall email first
- Follow [this heroku article](https://devcenter.heroku.com/articles/ssl-endpoint), however you will need to concat your .crt and your .ca-bundle possibly. That can be found [in this article](https://www.namecheap.com/support/knowledgebase/article.aspx/9756/33/installing-a-ssl-certificate-on-heroku-paid-ssl-endpoint). Note, you will not have to update your DNS records most likely, unless the generated Heroku endpoint changes.


* Other Setup Steps

- Google Analytics: Set the UA variable in the .env file
- [Enable newrelic on heroku](https://elements.heroku.com/addons/newrelic); setup a synthetic monitor for uptime (keeps the heroku app from going to sleep, and is good to know if your site is down)
- Setup up time pinger with some service for heroku

# Troubleshooting
- If you run into a puma error like the below, just run `touch tmp/pids/server.pid`
```/Users/elijahmurray/.rvm/gems/ruby-2.7.4/gems/puma-4.3.12/lib/puma/launcher.rb:377:in `stat': No such file or directory @ rb_file_s_stat - /Users/elijahmurray/Development/Personal/brick-investor/brickinvestor (Errno::ENOENT)```
