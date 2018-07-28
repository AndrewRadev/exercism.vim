Two commands are available that simply delegate to the `exercism` command-line tool. The first is "download":

``` vim
:Exercism download --exercise=<name> --track=<track-name>
:Exercism download --uuid=<uuid>
```

This downloads the exercise, but also does a "cd" into the directory the tool prints, and edits the directory's `README.md` in a fresh tab. It also completes the three main `--` flags.

The second command is "submit":

``` vim
:Exercism submit
```

It submits the current file to exercism.io as a solution. You can also provide an explicit list of files to submit, with file completion.

These particular commands are provided by the plugin, because they integrate nicely with the editor, providing some additional convenience. At this time, for the other functionality of the CLI, you should use the command-line instead.
