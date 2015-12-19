# analytics tools for maki

## Setup
### Install rbenv
```
$ brew install rbenv
$ brew install ruby-build
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ eval "$(rbenv init -)"
$ rbenv install 2.2.0
...
$ rbenv global 2.2.0
```

## Usage
### `expand_twitter_attributes.rb`

```
$ mysql -uroot analytics < db/twitter_links.sql
$ mysql -uroot analytics < db/twitter_attributes.sql
$ bundle 
...
$ bundle exec ruby bin/expand_twitter_attributes.rb
```
