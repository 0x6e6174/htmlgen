(defun html ()
  (page "laptop (old)"
        `((section ()
                   (h1 () "my old laptop")
                   (p () "see " (a (:href "/html/blog/posts/new-laptop.html") "blog post") (br) "and " (a (:href "/html/my-laptop.html") "updated page"))
                   (p () "Currently, I am using a T530 that has been heavily modified. "
                      "I used to use a W530, but I fucked it up trying to get tianocore on it and haven't bothered fixing the bios on it yet. "
                      "I have preordered a Framework 16 because I am the definition of their target audience. "
                      "Since W530s and T530s are basically identical barring the mainboard, there is no external difference between my W530 and T530 because I just yoinked all the parts from the W530."
                      (br)))
          (section ()
                   (image-column-container ()
                                           (image-container ()
                                                            (flex-column (:style "margin-right: 10px;")
                                                                         ,(exec-command "img-caption \"/files/laptop-keyboard.png\" \"photograph of my laptop's keyboard, which is blank because I sanded it.\"")
                                                                         ,(exec-command "img-caption \"/files/laptop-radio.jpg\" \"The software defined radio that goes in my laptop's disc drive.\"")
                                                                         ,(exec-command "img-caption \"/files/keybinds_graph.png\" \"Graph of my keybindings, they are hard to see\"")
                                                                         ,(exec-command "img-caption \"/files/laptop-charger-barrel.jpg\" \"charger barrel size adapter sticking out the back of my laptop\"")))
                                           (text-column ()
                                                        (p () "I have put an unreasonable amount of time in to messing with my laptop and as such am equally unreasonably proud of it."
                                                           (br))
                                                        (h3 () "Hardware modifications I have made to my laptop:")
                                                        (p () (ul ()
                                                                 (li () "Installed an older model's keyboard")
                                                                 (li () "Sanded the keyboard such that it is blank.")
                                                                 (li () "Upgraded most of its parts.")
                                                                 (li () "Put an SDR in its disc drive")
                                                                 (li () "Replaced the charging barrel with a worst bodge ever contest finalist because I left my charger at school for a weekend once and wanted to use my laptop."))
                                                           "Additionally, I have written a custom xkb file. Unfortunately the geometry file hasn't been updated since I modded in the new keyboard, but here it is anyways:"
                                                           (br))
                                                        ,(exec-command "img-caption \"/files/laptop-xkb-geometry.png\" \"my xkb geometry file compiled to a pdf\"")
                                                        (p () "Disregard the fucked up escape key, I was messing with it earlier. My keyboard isn't that notable beyond binding control to caps lock and binding the old control key to mode_switch. "
                                                           "Additionally, when mode_switch is pressed while an alphabetic key is pressed, it types a greek letter instead.")
                                                        (p () "I run artix (for the anti systemd meme), though upon getting my framework I intend to switch to gentoo. "
                                                           "I use i3 as my window manager with a somewhat cursed script to programmatically generate its config from a yaml file. "
                                                           "This script is vaguely necessary because"
                                                           (ul ()
                                                               (li () "I wanted a (programmatically generated) graph of all my keybinds as leaf nodes with different modes as trunk nodes and individual keys as edges")
                                                               (li () "I wanted to easily nest an arbitrarily large number of modes without it being a hassle"))
                                                           (br)
                                                           "an example of the function of this script is something like"
                                                           (br)
                                                           (br)
                                                           (div :class "code-container"
                                                                (div :class "io-container"
                                                                     (h3 () "Input (yaml):")
                                                                     (pre () (code () "
keybinds:
a: !Mode
    name: a
    keybinds:
        b: !Mode
            name: b
            keybinds: ...")))
                                                                (div :class "io-container"
                                                                     (h3 () "Output (i3config):")
                                                                     (pre () (code () "
mode a {
    bindsym b mode b 
}

mode b {
    bindsym ... ...
}

bindsym a mode a")))))
                                                        (p () "From the yaml config, my python script can parse it either into a (really bad) graph of keybinds (using the graphviz library or something like that) or into a valid i3 config file. "
                                                           "In my real config, I have a mode 'base' which is the default mode with no keybinds other than mod4+space, followed by a mode 'space' reached by pressing mod4+space. "
                                                           "From 'space' mode, other modes may be accessed, such as 'workspaces or windows' mode, bound under w. "
                                                           "This gets rather absurd (intentionally so) very quickly. "
                                                           "The combination to move to workspace 0 while in 'base' mode is to press mod4+space ('space' mode), w ('workspaces_or_windows' mode), s ('workspaces'), g ('workspaces_goto'), 0 (move to workspace 0).")
                                                        (p () "This system results in horrible user experience (but I don't care), great security (close to least intuitive setup possible), and—most importantly—an incredibly stupid graph of keybinds. "
                                                           "I find this unreasonably amusing.")
                                                        (p () "to my endless amusement, I may be partially to blame for the niri compositor having keybinding modes")
                                                        ,(exec-command "img-caption \"/files/niri-dev-keybind-graph.png \" \"YaLTeR, the niri dev, seeing my keybind graph and deciding to implement keybinding modes\"")))))))

