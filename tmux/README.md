
# Tmux tips 

tmux config file location is ~/.tumx.conf, you can make a soft link with ln.
such as:
    
    ln -s ~/dotconfig/tmux/tmux.conf ~/.tmux.conf

Put this line inside your .bashrc or similar

    alias tmux="TERM=screen-256color-bce tmux"

## Shortcut Reference Now a Ctrl-b or (`) options reference:

#### Basics

    ? get help
#### Session management

    s list sessions
    $ rename the current session
    d detach from the current session

#### Windows

    c create a new window
    , rename the current window
    w list windows
    n change to the next window
    p change to the previous window
    0 to 9 select windows 0 through 9

#### Panes

    - create a horizontal pane
    | create a vertical pane
    h move to the left pane. *
    j move to the pane below *
    l move to the right pane *
    k move to the pane above *
    H,J,L,K resize the pane size to 4 directions
    z maximaze the current pane(z again to back normal)
    q show pane numbers
    o toggle between panes
    } swap with next pane
    { swap with previous pane
    ! break the pane out of the window
    x kill the current pane

#### Miscellaneous

    t show the time in current pane
	# enter copy mode
	C-b/` [ 
	# mark selection start
	space
	# copy region
	Alt+w
	enter
	# Paste selecton
	C-b/` ]
	# see all paster buffers
	C-b/` #

#### Resurrent

    C-b/` Ctrl-s - Save
    C-b/` Ctrl-r - Restore
