*More instructions, settings and better completion coming up soon (hopefully).*

<hr>

Two commands are available that simply delegate to the `exercism` command-line tool:


``` vim
:Exercism download --exercise=<name> --track=<track-name>
```

Downloads the exercise, but also does a "cd" into the directory the tool prints, and edits the file `README.md` in that directory.

``` vim
:Exercism submit
```

Submits the current file.
