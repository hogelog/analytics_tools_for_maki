# analytics tools for maki

## `expand_twitter_attributes.rb`

```
$ mysql -uroot analytics < db/twitter_links.sql
$ mysql -uroot analytics < db/twitter_attributes.sql
$ bundle 
...
$ bundle exec ruby expand_twitter_attributes.rb
```
