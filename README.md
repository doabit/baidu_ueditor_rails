# Baidu ueditor for rails

[baidu ueditor][1] for rails, precompile codes from [tinymce-rails][2]

  [1]: http://ueditor.baidu.com/website/
  [2]: https://github.com/spohlenz/tinymce-rails

### Notice: The project is unreleased.

## Installation

Add this line to your application's Gemfile:

    gem 'baidu_ueditor_rails5', github: 'doabit/baidu_ueditor_rails', require: 'baidu_ueditor_rails'

And then execute:

    $ bundle


## Generating custom config js

Usage:


    rails g baidu_ueditor_rails:install


Then add codes in application.js


```ruby
//= require baidu_ueditor
//= require ueditor_custom_config
```

config `routes.rb`

```ruby
  mount BaiduUeditorRails::Engine => "/ueditor"
```

## Custom config

In ueditor_custom_config.js, it looks like:

```ruby
//ueditor custom config
(function () {
    window.CUSTOM_CONFIG = {
      // Insert your config code
      // toolbars: [
      //      ['Source','Undo','Redo','Cleardoc','SearchReplace','InsertImage','WordImage','Bold','ForeColor','JustifyLeft',
      //      'JustifyCenter','JustifyRight','JustifyJustify','RemoveFormat','FormatMatch','AutoTypeSet','PastePlain',
      //      'FontSize','Preview','Link','FullScreen', 'PageBreak', 'InsertTable','Attachment','InsertVideo']
      // ],
      serverUrl: '/ueditor',
      imageManagerUrlPrefix: ''
    };
    jQuery.extend(window.UEDITOR_CONFIG, window.CUSTOM_CONFIG);
})();
```

you can write your custom config in

```ruby
window.CUSTOM_CONFIG = {
  //.........
};
```

## Views

```javascript
<script type="text/javascript">
  var editor = new UE.ui.Editor();
  editor.render("your_textarea_id");
</script>
```

## TODO

1. Add upload image and file.
2. Add form helpers.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
