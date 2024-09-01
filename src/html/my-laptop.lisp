(defun html ()
  (page "laptop"
        `((section ()
                   (h1 () "my laptop is rather haunted")
                   "see also: " (a (:href "/html/my-old-laptop.html") "old laptop")
                   "I am bad at using technology."
                   (br)
                   "this is not due to lack of technical ability, but instead due to the accumulation of unreasonable quirks over time in every computer I exert any degree of control over.")
          (section ()
                   (h2 () "booting and the operating system")
                   (p () "I do not use a bootloader. "
                      "instead, I have a custom kernel build based off the arch kernel with filesystem and compression drivers such that I can boot straight from my kernel. "
                      "I also do not have an initramfs.")
                   (p () "technically, I don't use arch linux. "
                      "I use [a custom build of] the arch kernel and arch package repos, but actually run artix. "
                      "a function of this is that instead of systemd, I use openrc."))
          (section ()
                   (h2 () "seat management and hardware issue mitigation")
                   (p () "I once thought it would be entertaining to remove elogind from my system. "
                      "of course, I still needed it installed as a library, but disabling it was trivial. "
                      "it was replaced with seatd for seat management and acpid to suspend my computer when I close the lid. "
                      "this worked for a time, however after a couple months of this setup, elogind inexplicably began to be started by my init system. "
                      "I do not know how or why, I did not change anything, nor is there anything matching 'elogind' in /etc/init.d/. "
                      "this was bad because it would interfere with acpid.")
                   (h3 () "the solution")
                   (pre () "~ &lambda; cat /etc/acpi/lid.sh
#!/bin/sh
cat /proc/acpi/button/lid/LID0/state | grep open && (modprobe i2c_hid_acpi) || (
    killall elogind-daemon
    rmmod i2c_hid_acpi
    (test -e /home/catalie/.should-power-off) && s2ram)")
                   (p () "I overcame this issue simply by attempting to kill elogind every time I close the lid of my computer.")
                   (p () "you may wonder, why is it running rmmod i2c_hid_acpi every time it close its laptop's lid. "
                      "you see, the framework 16 has an issue in which the trackpad and keyboard are not properly barred from waking the computer from suspend while the lid is closed. "
                      "in addition to this, the screen can flex just enough to press a key or bump the trackpad. "
                      "this causes the laptop to wake in my bag and attempt to boil the contents of my backpack. "
                      "the keyboard waking the computer from suspend can be ammended by running "
                      (pre () "sudo acpitool -w | grep enabled | awk '{print $1}' | sed 's/\\.//' | xargs -I{} sudo acpitool -W {}")
                      "however, the trackpad is not in the list of acpi wakeup devices for whatever reason. "
                      "thus, upon the lid being closed, I simply unload the kernel module the trackpad requires and load it again upon opening the lid."))
          (section ()
                   (h2 () "environment")
                   (p () "I use wayland, specifically hyprland. "
                      "this is unfortunate because it is bad software (this will be elaborated upon), but I like the special workspace system. "
                      "my status bar and notification system are written in gjs with ags. I resent this because it involves javascript, but oh well. "
                      "when libastal gets documentation, I will probably rewrite my ui in that. "
                      "my terminal emulator is my own build of st. "
                      "I have yet to find a good terminal that supports all the things I want for wayland, so xwayland it is."))
          (section ()
                   (h2 () "keyboard")
                   (p () "unlike my previous laptop, I had the option to buy this laptop such that it came with a blank keyboard. "
                      "in accordance with this, I have not sanded my keyboard. "
                      "the framework 16 keyboard runs qmk, this is very nice. "
                      "the keyboard firmware is now hardcoded to be dvorak instead of using a custom console and xkb map. "
                      "on one hand this is nice because it means I do not need to edit xkb files to remap caps lock to control, but on the other hand if I plug an external keyboard in to my laptop, it will be qwerty and I will have to load my xkb map or type in qwerty. I can probably type in qwerty. "
                      "I need to remember to finish my keyboard config at some point. also, I should make the button that breaks the keyboard until I remove it and put it back in harder to press."))
          (section ()
                   (h2 () "irregular bugs")
                   (ul ()
                       (li () "killing firefox kills my compositor what I would estimate to be 20% of the time")
                       (li () "killing firefox causes my headphones to disconnect what I would estimate to be 40% of the time")
                       (li () "no audio devices other than my headphones are recognized after boot until I run "
                          (pre () "unfuck audio"))
                       (li () "when displaying https://wiki.gnuradio.org/index.php/Embedded_Python_Block in any web browser, or a screenshot of this webpage fullscreen on my laptop in any wayland compositor, my screen starts flickering. it only occures with this page. unplugging my computer causes the flickering to reduce in frequency. this will not occur if my mouse pointer is not in the top 2/5ths of the screen.")
                       (li () "closing my computer causes network manager to become inoperable. it does not crash, it just stops working.")
                       (li () "closing my computer causes firefox to be unable to retrieve data regardless of if network manager is working")
                       (li () "sometimes, pipewire ceases to function. this typically happens after several days of uptime."))))))


