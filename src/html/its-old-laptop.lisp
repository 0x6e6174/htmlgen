(defun html ()
  (page "laptop (old)"
        `((section ()
                   (h1 () "its old laptop")
                   (p () "see " (a (:href "/html/blog/posts/new-laptop.html") "blog post") (br) "and " (a (:href "/html/its-laptop.html") "updated page"))
                   (p () "currently, this one is using a T530 that has been heavily modified. "
                      "it used to use a W530, but it fucked it up trying to install tianocore on it and it has not bothered to fix the bios on it yet. "
                      "it has preordered a framework 16 because it is the definition of that company's target audience. "
                      "since W530s and T530s are basically identical barring the mainboard, there is no external difference between its W530 and T530 because it just yoinked all the parts from the W530."
                      (br)))
          (section ()
                   (image-column-container ()
                                           (image-container ()
                                                            (flex-column (:style "margin-right: 10px;")
                                                                         ,(exec-command "img-caption \"/files/laptop-keyboard.png\" \"photograph of its laptop's keyboard, which is blank because it sanded it.\"")
                                                                         ,(exec-command "img-caption \"/files/laptop-radio.jpg\" \"the software defined radio that goes in its laptop's disc drive.\"")
                                                                         ,(exec-command "img-caption \"/files/keybinds_graph.png\" \"graph of its keybindings, they are hard to see\"")
                                                                         ,(exec-command "img-caption \"/files/laptop-charger-barrel.jpg\" \"charger barrel size adapter sticking out the back of its laptop\"")))
                                           (text-column ()
                                                        (p () "natalie has put an unreasonable amount of time in to messing with its laptop and as such it is equally unreasonably proud of it."
                                                           (br))
                                                        (h3 () "hardware modifications it has made to its laptop:")
                                                        (p () (ul ()
                                                                 (li () "installed an older model's keyboard")
                                                                 (li () "sanded the keyboard such that it is blank.")
                                                                 (li () "upgraded most of its parts.")
                                                                 (li () "put an SDR in its disc drive")
                                                                 (li () "replaced the charging barrel with a worst bodge ever contest finalist because it left its charger at school for a weekend once and wanted to use its laptop."))
                                                           "additionally, it has written a custom xkb file. unfortunately the geometry file hasn't been updated since it modded in the new keyboard, but here it is anyways:"
                                                           (br))
                                                        ,(exec-command "img-caption \"/files/laptop-xkb-geometry.png\" \"its xkb geometry file compiled to a pdf\"")
                                                        (p () "disregard the fucked up escape key, it was messing with it earlier. this thing's keyboard isn't that notable beyond binding control to caps lock and binding the old control key to mode_switch. "
                                                           "additionally, when mode_switch is pressed while an alphabetic key is pressed, it types a greek letter instead.")
                                                        (p () "it run artix (for the anti systemd meme), though upon getting its framework it intends to switch to gentoo. "
                                                           "natalie uses i3 as its window manager with a somewhat cursed script to programmatically generate its config from a yaml file. "
                                                           "this script is vaguely necessary because:"
                                                           (ul ()
                                                               (li () "it wanted a (programmatically generated) graph of all its keybinds as leaf nodes with different modes as trunk nodes and individual keys as edges")
                                                               (li () "it wanted to easily nest an arbitrarily large number of modes without it being a hassle"))
                                                           (br)
                                                           "an example of the function of this script is something like"
                                                           (br)
                                                           (br)
                                                           (div (:class "code-container")
                                                                (div :class "io-container"
                                                                     (h3 () "input (yaml):")
                                                                     (pre () (code () "
keybinds:
a: !Mode
    name: a
    keybinds:
        b: !Mode
            name: b
            keybinds: ...")))
                                                                (div (:class "io-container")
                                                                     (h3 () "output (i3config):")
                                                                     (pre () (code () "
mode a {
    bindsym b mode b 
}

mode b {
    bindsym ... ...
}

bindsym a mode a")))))
                                                        (p () "From the yaml config, natalie's python script can parse it either into a (really bad) graph of keybinds (using the graphviz library or something like that) or into a valid i3 config file. "
                                                           "in its real config, it has a mode 'base' which is the default mode with no keybinds other than mod4+space, followed by a mode 'space' reached by pressing mod4+space. "
                                                           "from 'space' mode, other modes may be accessed, such as 'workspaces or windows' mode, bound under w. "
                                                           "this gets rather absurd (intentionally so) very quickly. "
                                                           "the combination to move to workspace 0 while in 'base' mode is to press mod4+space ('space' mode), w ('workspaces_or_windows' mode), s ('workspaces'), g ('workspaces_goto'), 0 (move to workspace 0).")
                                                        (p () "this system results in horrible user experience (not that it cares), great security (close to least intuitive setup possible), and—most importantly—an incredibly stupid graph of keybinds. "
                                                           "it find this unreasonably amusing.")
                                                        (p () "to this thing's endless amusement, it may be partially to blame for the niri compositor having keybinding modes")
                                                        ,(exec-command "img-caption \"/files/niri-dev-keybind-graph.png \" \"YaLTeR, the niri dev, seeing this one's keybind graph and deciding to implement keybinding modes\"")))))))

