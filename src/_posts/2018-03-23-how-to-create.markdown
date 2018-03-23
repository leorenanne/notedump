---
layout: post
title:  "How to deploy your website from scratch"
date:   2018-03-21 01:23:02 +0000
categories: HowTo
---

For this post, I will be sharing with you our step by step journey on how we set up this website's infrastructure from scratch using the most minimal cost possible.

## Step 1 - You need a site to launch

For this project, we will be launching a basic static blogging website. I want this website to be able to automatically transform my plain texts with basic markdowns into pretty blogs.

For this, we decided to go with 
[`Jekyll`](https://jekyllrb.com/)
.

### Use Docker to run Jekyll

To launch Jekyll we decided we will be using 
[`Docker`](https://www.docker.com/)
so that we wouldn't need to set up all the dependencies needed to launch Jekyll on our local machine.

* Make your Project directory. 
* Inside your directory, create your
[`docker-compose.yml`](https://github.com/leorenanne/notedump/blob/master/docker-compose.yml)
. Since Jekyll uses Ruby, we made use of an existing Docker image
[`ruby:2.5`](https://hub.docker.com/_/ruby/)
that already contains ruby.
* You can mount your current project directory on the docker container by doing
{% highlight yml %}
...
    volumes:
    - .:/cwd
    working_dir: /cwd
...
{% endhighlight %}

* Since we're running Jekyll inside a Docker container, we would need to set up our own configurations. So we create a `_config.yml` file for production and `_config_dev.yml` for development.
* In production `_config.yml` , specify your URL (we'll have a look at puchasing domain names later)
{% highlight yml %}
title: Notedump
 url: "https://notedump.com"

# Build settings
 markdown: kramdown
 theme: minima
 plugins:
   - jekyll-feed
{% endhighlight %}
* For development `_config_dev.yml`, specify your localhost url with your specific port
{% highlight yml %}
url: "http://localhost:4000"
{% endhighlight %}
* To run Jekll we need to do:
{% highlight yml %}
<!-- jekyll serve --livereload --host 0.0.0.0 \
--config src/_config.yml,src/_config_dev.yml  -->
-s src

{% endhighlight %}

* So our `docker-compose` looks something like:
![image]({{"/assets/2018-03-23/docker-compose.jpg"}})



