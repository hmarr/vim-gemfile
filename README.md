# vim-gemfile

A faster way of adding `gem "some_gem", "~> 1.2.3"` to your Gemfiles.

On invoking `:GemfileAdd`, this plugin will query rubygems.org to find the
latest version, and add the relevant line to your Gemfile wherever the cursor
is.

The name of the gem may be provided as an argument, or you will be prompted for
it if no argument is given.

![](http://hmarr.com/vim-gemfile/images/vim-gemfile.gif)

## Installation

Assuming you're using Vundle or similar, add the following to your vimrc:

```vim
Plugin 'hmarr/vim-gemfile'
```


