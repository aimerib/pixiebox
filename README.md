# Pixiebox

Docker development simplified.

Start pixiebox and continue with the way you have always done things, except 
now, isolated inside containers


## Install CLI


```bash
$ gem install pixiebox
$ pixiebox install
```

That's it your done

**Available boxes**

    elixir
    nodejs
    python
    rails
    ruby

**Create rails box**

```bash
$ mkdir -p Code/rails
$ cd Code/rails
$ pixiebox init rails
```

Your box is up and running, use your container-ized rails as you would normally

**Create a rails project**
```bash
$ pb-gem install rails --no-ri --no-rdoc
$ pb-rails new .
$ pb-rails c
$ pb-rake -T
$ pb-rails s
```

**Install gems, irb, bundler and more**
```bash
$ pb-gem install rails --no-ri --no-rdoc
$ pb-irb
$ pb-bundle install
$ pb-ruby
```

Everything is running inside your box !
Commands are namespaced to avoid conflict with already existing tools in your
environment.

## Detailed Usage

```bash
Commands:
  pixiebox boxes               # list of available boxes
  pixiebox help [COMMAND]      # Describe available commands or one specific command
  pixiebox init [BOX]          # initialize directory for use with pixiebox
  pixiebox install             # installs pixiebox
  pixiebox reset               # reset pixiebox containers
  pixiebox restart             # restart pixiebox
  pixiebox service SUBCOMMAND  # do things with the SERVICES
  pixiebox ssh [SERVICE]       # open shell to service
  pixiebox start               # start pixiebox
  pixiebox status              # current status of containers
  pixiebox stop                # stop pixiebox
  pixiebox uninstall           # removes pixiebox
  pixiebox update              # udpates pixiebox
  pixiebox version             # displays current version

Commands:
  pixiebox service add [SERVICE]             # adds a service to your box
  pixiebox service build [SERVICE] optional  # builds the pixiebox
  pixiebox service help [COMMAND]            # Describe subcommands or one specific subcommand
  pixiebox service list                      # list available services
  pixiebox service remove [SERVICE]          # removes a service from your box

Options:
  [--verbose], [--no-verbose]  # Verbose debugging output
```

### Dependencies
**Linux**

* build-essential
* ruby
* ruby-dev


## Development

To run the tests you'll need ruby ^2.3 since we are using the <<~EOS operator (un-indented multiline strings)

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To use without installing, use:

```bash
$ bin/pixiebox_dev version
```

To install locally:

```bash
$ rake build
$ gem install pkg/pixiebox-x.x.x.gem
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

