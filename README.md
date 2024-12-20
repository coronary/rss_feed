# WFMU RSS Parser
the ultimate goal of this project is to be able to easily browse the archives of independent radio stations but I'm starting small.

## Current Functionality
- given an rss feed in [this format](https://wfmu.org/archivefeed/mp3.xml), print to stdout text in the shape of a `pls` file that most media players can read (currently using vlc for testing and playback)

## Requirements
- [ Lua ](https://www.lua.org/) Interpreter
- [ cURL ](https://curl.se/docs/manpage.html)

## Usage
1. Download `parse.lua`
2. Run `chmod +x parse.lua` to make it executable
3. Profit

```bash
curl https://wfmu.org/archivefeed/mp3.xml | ./parse.lua > recent_archives.pls
vlc recent_archives.pls
```

## Troubleshooting
If the script throws an error about lua not being found double check that line 1 matches the path to your lua executable. you can check your local path by typing `which lua`.
