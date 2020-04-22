# `sh-pather`

Strict, non-redundant `PATH` builder helpers.

## Usage

Prepend PATH:

  ```shell
  $ . bin/path_prefix
  $ ( PATH=/foo/bar ; path_prefix "${HOME}/.local/bin"; echo $PATH )
  /home/user/.local/bin:/foo/bar
  ```

Append PATH:

  ```shell
  $ . bin/path_suffix
  $ ( PATH=/foo/bar ; path_suffix "${HOME}/.local/bin"; echo $PATH )
  /foo/bar:/home/user/.local/bin
  ```

It's DRY, but will reorder:

  ```shell
  $ ( PATH=/usr/bin:/usr/local/bin ; path_suffix "/usr/bin"; echo $PATH )
  /usr/local/bin:/usr/bin
  ```

It's strict:

  ```shell
  $ ( PATH=/usr/bin ; path_suffix "/no/such/path"; echo $PATH )
  /usr/bin
  ```

## Installation

The author recommends cloning the repository and wiring its `bin/` to `PATH`.

You can also create a symlink to the commands (`path_prefix` and `path_suffix`)
from a location already on `PATH`, such as `~/.local/bin`.

Or you could clone the project and run the commands first to evaluate them,
before deciding how you want to wire it.

Alternatively, you might find that using a shell package manager, such as
[`bkpg`](https://github.com/bpkg/bpkg),
is more appropriate for your needs, e.g.,
`bpkg install -g landonb/sh-pather`.

### Makefile install

The included `Makefile` can also be used to help install.

- E.g., you could clone this project somewhere and
  then run a `sudo make install` to install it globally:

  ```shell
  git clone https://github.com/landonb/sh-pather.git
  cd sh-pather
  # Install to /usr/local/bin
  sudo make install
  ```

- Specify a `PREFIX` to install anywhere else, such as locally, e.g.,

  ```shell
  # Install to $USER/.local/bin
  PREFIX=~/.local/bin make install
  ```

  And then ensure that the target directory is on the user's `PATH` variable.

  You could, for example, add the following to `~/.bashrc`:

  ```shell
  export PATH=$PATH:$HOME/.local/bin
  ```

### Manual install

If you clone the project and want the path commands to be
loaded in your shell, remember to ensure that they can be found
on `PATH`, e.g.,

  ```shell
  git clone https://github.com/landonb/sh-pather.git
  export PATH=$PATH:/path/to/sh-pather/bin
  . pather.sh
  ```

Enjoy!

