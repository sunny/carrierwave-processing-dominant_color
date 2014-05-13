Carrierwave::Processing::DominantColor
======================================

Adds the dominant color of an image to your database whenever you upload it
with the CarrierWave gem.


Installation
------------

Add this line to your application's Gemfile:

```ruby
gem "carrierwave-processing-dominant_color"
```

And then execute:

```sh
$ bundle
```

On your Rails model where you attach your uploader, you need a `dominant_color`
attribute. Add it with a migration by replacing "Articles" with your model
in the following command:

```sh
$ rails g migration AddDominantColorToArticles dominant_color
$ rake db:migrate
```

Create an initializer `config/initializers/dominant_color.rb`:

```ruby
require "carrierwave/processing/dominant_color"
Miro.options[:color_count] = 1
```


Processing your uploader
------------------------

In your uploader, include the module and call the processor:

```ruby
class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Processing::DominantColor
  …
  process :store_dominant_color
end
```
If you have several versions of your uploader, I suggest adding it to the
smallest version so that processing goes faster. For example:

```ruby
…
version :medium do
  process resize_to_fill: [200, 200]
end

version :thumb, from_version: :medium do
  process resize_to_fill: [42, 42]
  process :store_dominant_color
end
…

```


Using your dominant color
-------------------------

A good way of using your dominant color is to put it as a background to your
image tags:

```erb
<%= image_tag(article.photo.url(:thumb), style: "background: #{article.dominant_color}") %>
```


Contributing
------------

1. Fork it ( https://github.com/sunny/carrierwave-processing-dominant_color/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
