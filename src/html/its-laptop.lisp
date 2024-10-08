(defun html ()
  (page "laptop"
        `((section ()
                   (h1 () "natalie's laptop is rather haunted")
                   "see also: " (a (:href "/html/its-old-laptop.html") "old laptop")
                   "natalie is bad at using technology."
                   (br)
                   "this is not due to lack of technical ability, but instead due to the accumulation of unreasonable quirks over time in every computer it exerts any degree of control over.")
          (section ()
                   (h2 () "booting and the operating system")
                   (p () "natalie does not use a bootloader." ,(exec-command "make-footnote \"it finds them to be very annoying and in its experience unreliable\"")
                      "instead, it has a custom kernel build based off the arch kernel with filesystem and compression drivers such that it can boot straight from its kernel. "
                      "it also does not have an initramfs.")
                   (p () "technically, natalie does not use arch linux. "
                      "it uses [a custom build of] the arch kernel and arch package repos, but actually run artix. "
                      "a function of this is that instead of systemd, it uses openrc.")
                   ,(exec-command "put-footnotes"))
          (section ()
                   (h2 () "seat management and hardware issue mitigation")
                   (p () "natalie once thought it would be entertaining to remove elogind from its system. "
                      "of course, it was still required to be installed as a library, but disabling it was trivial. "
                      "it was replaced with seatd for seat management and acpid to suspend its computer when natalie closes the lid. "
                      "this worked for a time, however after a couple months of this setup, elogind inexplicably began to be started by the init system. "
                      "it does not know how or why, it did not change anything, nor is there anything matching 'elogind' in /etc/init.d/. "
                      "this was bad because it would interfere with acpid.")
                   (h3 () "the solution")
                   (pre () "~ &lambda; cat /etc/acpi/lid.sh
#!/bin/sh
cat /proc/acpi/button/lid/LID0/state | grep open && (modprobe i2c_hid_acpi) || (
    killall elogind-daemon
    rmmod i2c_hid_acpi
    (test -e /home/catalie/.should-power-off) && s2ram)")
                   (p () "natalie overcame this issue simply by attempting to kill elogind every time it closes the lid of its computer.")
                   (p () "you may wonder, why is it running rmmod i2c_hid_acpi every time it close its laptop's lid. "
                      "you see, the framework 16 has an issue in which the trackpad and keyboard are not properly barred from waking the computer from suspend while the lid is closed. "
                      "in addition to this, the screen can flex just enough to press a key or bump the trackpad. "
                      "this causes the laptop to wake in its bag and attempt to boil the contents of its backpack. "
                      "the keyboard waking the computer from suspend can be ammended by running "
                      (pre () "sudo acpitool -w | grep enabled | awk '{print $1}' | sed 's/\\.//' | xargs -I{} sudo acpitool -W {}")
                      "however, the trackpad is not in the list of acpi wakeup devices for whatever reason. "
                      "thus, upon the lid being closed, it simply unloads the kernel module the trackpad requires and load it again upon opening the lid."))
          (section ()
                   (h2 () "environment")
                   (p () "it use wayland, specifically hyprland. "
                      "this is unfortunate because it is bad software (this will be elaborated upon), but natalie like the special workspace system. "
                      "its status bar and notification system are written in gjs with ags. it resents this because it involves javascript, but oh well. "
                      "when libastal gets documentation, it will probably rewrite its ui in that. "
                      "its terminal emulator is foot because foot does not implement unecessary features."))
          (section ()
                   (h2 () "keyboard")
                   (p () "unlike its previous laptops, it had the option to buy this laptop such that it came with a blank keyboard. "
                      "in accordance with this, natalie has not sanded its keyboard. "
                      "the framework 16 keyboard runs qmk, this is very nice. "
                      "the keyboard firmware is now hardcoded to be dvorak instead of using a custom console and xkb map. "
                      "on one hand this is nice because it means natalie does not need to edit xkb files to remap caps lock to control, but on the other hand if natalie plugs an external keyboard in to its laptop, it will be qwerty and natalie will have to load its xkb map or type in qwerty. it can probably type in qwerty. "
                      "it needs to remember to finish its keyboard config at some point. also, it should make the button that breaks the keyboard until it removes it and put it back in harder to press."))
          (section ()
                   (h2 () "irregular bugs")
                   (ul ()
                       (li () "killing firefox kills its compositor what it would estimate to be 20% of the time")
                       (li () "killing firefox causes its headphones to disconnect what it would estimate to be 40% of the time")
                       (li () "setting firefox to be a floating window causes its entire computer to freeze roughly 10% of the time" ,(exec-command "make-footnote \"it should probably make new firefox profiles. its current firefox profile is haunted, as it has been using it since 7th grade.\""))
                       (li () "no audio devices other than its headphones are recognized after boot until it runs "
                          (pre () "unfuck audio"))
                       (li () "when displaying https://wiki.gnuradio.org/index.php/Embedded_Python_Block in any web browser, or a screenshot of this webpage fullscreen on its laptop in any wayland compositor, the computer screen starts flickering. it only occures with this page. unplugging the computer causes the flickering to reduce in frequency. this will not occur if the mouse pointer is not in the top 2/5ths of the screen." ,(exec-command "make-footnote \"what on earth\""))
                       (li () "closing its computer causes network manager to become inoperable. it does not crash, it just stops working.")
                       (li () "closing its computer causes firefox to be unable to retrieve data regardless of if network manager is working")
                       (li () "sometimes, pipewire ceases to function. this typically happens after several days of uptime."))
                   ,(exec-command "put-footnotes")))))


