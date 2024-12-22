package = "rss_feed"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/coronary/rss_feed.git"
}
description = {
   detailed = [[
## Current Functionality
- given an rss feed in [this format](https://wfmu.org/archivefeed/mp3.xml), print to stdout text in the shape of a `pls` file that most media players can read (currently using vlc for testing and playback)]],
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
	"luaexpat >= 1.5.2-1"
},
build = {
   type = "builtin",
   modules = {
      parse = "parse.lua"
   }
}
