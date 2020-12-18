# yodots
__My dotfiles for:__  \
cvim (Chromium-vim) \
karabiner.edn (karabiner + [goku](https://github.com/yqrashawn/GokuRakuJoudo))

# Extended Descriptions
Extended descriptions for each config file

## cvim
My config file (.cvimrc) for cVim (vim bindings for chrome).
The cVim project is no longer maintained by its owner, but it still works perfectly. I have [forked](https://github.com/yomotherboard/chromium-vim) the project and added a few things with more to come.

## modes
### select mode

## browser functions (non-vim)
### g (go)
Go mode scrolls to specific sections of webpages and if applicable it collects the items of that section into the [selection list](#select-mode).

Suffix letters that have a high letter frequency are reserved for site specific mappings. These should ideally be such intuitive choices that you could guess them without consulting the configuration. 

Alternatively, those with low letter frequency should be used for frequently encountered webpage items (v -> reviews, x -> specs, z -> suggestions). The choice of letter in the latter case will generally be diaphonically similar to the word it represents.

Binding this way is ideal. First, it ensures the highest probability that the first letter of the name of a site specific webpage item is available for binding. Second, it ensures that words which have a low letter frequency (i.e. are unlikely to start or belong to a target item's name) are used very frequently. Therefore, these bindings are memorized despite their less direct relationship with the items they represent.

<ul>
  gc : site specific \
  gf : site specific \
  gg : top of page \
  go : site specific \
  gx : specs(x) \
  gv : re(v)iews \
  gz : suggestions(z)
</ul>

### Site-specific Behavior
cVim bindings can be mapped in a url-specific manner. These bindings can be set to execute Javascript scripts, allowing for powerful site-specific behavior/navigation.

## karabiner
karabiner is a program for macos that grabs keyboard input events and remaps them before they are processed by the operating system. Keyboard inputs can be mapped to any combination of keys and system commands, and conditions can be used to change mappings based on context (active application, varible state, etc). It is possible to write a powerful karabiner configuration [directly as a json file](https://karabiner-elements.pqrs.org/docs/json/root-data-structure/). However, it is much easier to use the [goku compiler](https://github.com/yqrashawn/GokuRakuJoudo) to create complex configurations.

### functions
functions are defined in goku format by the format
``` edn
  :function-name "... %s ..."
```
where `"..."` is a shell script and `%s` is replaced by your function argument.

__Here are some of my more useful functions with brief descriptions:__ \
`:vim "file path"` opens a new terminal with the file specified by path argument open in vim. \
`:new-cl "script"` opens a new terminal and runs the script given by the argument. \
`:bluetooth "device id"` powers on bluetooth and conncts to the bluetooth device given by the device id argument (uses [blueutil](https://github.com/toy/blueutil) for cli). \
`:open-chromium "url"` opens a new chromium tab with the url given by the argument.


### modes/layers
#### vim mode
I have configured a vim mode that activates/deactivates when caps-lock__-> return is pressed. It has many basic vim features working well but it is still a work in progress. The goal of this mode is to provide as much vim functionality as possible to basic text editors/browsers.
