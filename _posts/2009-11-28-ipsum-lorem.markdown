---
layout: post
title: Ipsum lorem
tags: [lorem, ipsum]
---

Nullam velit nulla, pellentesque dignissim scelerisque et, mollis pellentesque sem. Curabitur euismod libero nulla. Quisque imperdiet felis tellus. Fusce vel lectus sem. Proin scelerisque accumsan mi ut ultricies. Praesent eu semper dui. Donec nibh tortor, auctor id ultricies in, luctus vitae libero. Mauris eros neque, vehicula in congue a, pellentesque ut nulla. Donec vel convallis massa. In id congue enim. Sed rhoncus odio diam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla varius faucibus dolor, sed sagittis odio dictum non. Donec at porttitor ante. Mauris tincidunt consequat egestas.

<!-- more -->

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed enim et diam volutpat cursus sed a justo. Curabitur consequat viverra massa, non tempus nibh gravida non. Proin eros nunc, varius sit amet bibendum et, feugiat molestie nibh. Sed tortor velit, euismod sed bibendum a, tempor vitae est. Sed vitae orci massa, ut molestie tellus. Suspendisse ac dolor convallis justo *imperdiet vulputate*. Ut aliquet, nibh sit amet tristique lacinia, turpis purus eleifend dolor, id euismod dolor arcu sed leo. Aenean congue euismod egestas. Curabitur id eros risus. Ut et blandit nibh. Donec sapien elit, blandit suscipit bibendum a, ultrices ut urna.

And now, some Ruby!

{% highlight ruby %}
def self.configuration(override)
  # _config.yml may override default source location, but until
  # then, we need to know where to look for _config.yml
  source = override['source'] || Jekyll::DEFAULTS['source']

  # Get configuration from <source>/_config.yml
  config_file = File.join(source, '_config.yml')
  begin
    config = YAML.load_file(config_file)
    raise "Invalid configuration - #{config_file}" if !config.is_a?(Hash)
    STDOUT.puts "Configuration from #{config_file}"
  rescue => err
    STDERR.puts "WARNING: Could not read configuration. Using defaults (and options)."
    STDERR.puts "\t" + err.to_s
    config = {}
  end

  # Merge DEFAULTS < _config.yml < override
  Jekyll::DEFAULTS.deep_merge(config).deep_merge(override)
end
{% endhighlight %}

And next, a short console session!

{% highlight console %}
> ./configure --without-server
> make
> make install
{% endhighlight %}

Pellentesque non bibendum enim. Aliquam sit amet risus mauris, et blandit tellus. Etiam vehicula enim eu odio ultricies hendrerit. Vestibulum vel ipsum justo. Sed facilisis ultricies mauris, eu cursus nibh sagittis a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus ultrices diam id tortor dignissim vehicula. Etiam eget elit odio, pharetra commodo nisl. Etiam imperdiet convallis ipsum sit amet viverra. Mauris molestie auctor lacinia. Vestibulum viverra, dolor ultricies sodales auctor, libero eros ultricies nunc, consectetur ornare metus risus a justo.

Nullam orci ante, volutpat vel vehicula ac, posuere a odio. Donec viverra, dui vulputate porta consectetur, dui tortor venenatis magna, vitae porta nisl velit id massa. Cras scelerisque felis ut felis commodo vel semper nulla auctor. Nunc non dui ut est rutrum gravida sollicitudin rhoncus ante. Cras tincidunt libero a leo lacinia hendrerit. Morbi luctus accumsan purus eu faucibus. Nunc posuere, arcu a fermentum porttitor, orci nisl ultrices erat, id pellentesque dolor sem a elit. Aenean nec odio erat, et euismod neque. Integer suscipit consequat blandit. Ut non ante in dolor faucibus euismod nec nec lacus. Vivamus porttitor libero vel libero pharetra porttitor. Sed nec erat dui, quis lacinia augue. Pellentesque eget urna quis orci ultricies malesuada. Donec venenatis euismod magna, et ultrices lectus pulvinar eget. Nam at turpis tellus. Maecenas elit augue, ullamcorper rhoncus aliquet eu, elementum ut augue. Sed sollicitudin ante quis dui sollicitudin fermentum congue nisl feugiat. Donec rhoncus convallis viverra. Aliquam tempor pulvinar sagittis.

Aenean feugiat congue commodo. Maecenas consequat vulputate congue. Fusce elit lacus, porta non vestibulum laoreet, tristique in orci. Nulla aliquet luctus malesuada. Duis vel urna at lorem vehicula sodales dictum vel diam. Pellentesque nec varius nulla. Praesent tempus vestibulum dolor eget faucibus. Phasellus urna mi, euismod aliquet tincidunt et, pellentesque a nisi. Praesent vehicula mauris consequat enim tincidunt lacinia. Sed a sem libero. Nam porta sem vitae odio tempor posuere. Morbi at mauris eu diam cursus gravida. Praesent porttitor dui a ligula pellentesque varius. Nulla tincidunt dui a mi molestie rutrum. Curabitur dui lacus, porttitor id eleifend sit amet, consectetur quis urna. Integer rutrum sollicitudin ante vel suscipit. Cras ac purus sem. Nullam consequat, massa id scelerisque gravida, eros nisl fermentum urna, ut convallis enim sem eget lorem.
