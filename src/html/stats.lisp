(defun html () 
  (page "woah, data"
        `((section () 
                   (h1 () "stats! data! wow!")
                   "boring information about me and my computes, delivered right to your web browser (or terminal)!"
                   "why collect information about your users when your users could collect information about you?")
          (section () 
                   (h2 () "information:")
                   ,(exec-command "for line in $(cat sludge/src/lib/router.py | grep Route -A1 | grep '/stats/' | sed \"s/'//g; s/,//g\" | cut -d= -f3); do echo \"$(make-link $line)\"; done")))))
