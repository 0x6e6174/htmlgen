(defun html () 
  (page "woah, data"
        `((section () 
                   (h1 () "stats! data! wow!")
                   "boring information about it and its computers, delivered right to your web browser (or terminal)!"
                   "why collect information about people visiting this site when they could instead collect information about this natalie?")
          (section () 
                   (h2 () "information:")
                   ,(exec-command "for line in $(cat sludge/src/lib/router.py | grep Route -A1 | grep '/stats/' | sed \"s/'//g; s/,//g\" | cut -d= -f3); do echo \"$(make-link $line)\"; done")))))
