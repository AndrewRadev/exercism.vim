*More instructions, settings and better completion coming up soon (hopefully).*

<hr>

Two commands are available that simply delegate to the `exercism` command-line tool:


``` vim
:Exercism download --exercise=<name> --track=<track-name>
:Exercism download --uuid=<uuid>
```

Downloads the exercise, but also does a "cd" into the directory the tool prints, and edits the directory's `README.md` in a fresh tab.

``` vim
:Exercism submit
```

Submits the current file. You can also provide an explicit list of files, but, currently, you won't get file completion.
