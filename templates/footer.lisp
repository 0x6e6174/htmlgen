(defun footer () 
  `(footer ()
           (div ()
                "page rendered at $[date +%s]"
                (br)
                "page compiled at " ,(exec-command "date +%s"))
           ,(exec-command "include files/88x31/natalieee.net.html")
           (div ()
                (footnote (:style "margin-top: 5px") "all content, with the exception of 88x31 buttons or unless otherwise noted is created by me and is licensed under a CC BY-NC-SA 4.0 license."))
           (a (:href "https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en")
              (img (:src "/files/by-nc-sa.png" :alt "license 88x31" :width "88" :height "31")))
           (footnote (:style "margin-top: 5px") "▖▖▖▖▘▖▖▖▖▘▌▖▖▖▘")))

