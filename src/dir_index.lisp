(defun html () 
  (page "index of {path}" 
        '((section () 
                   (h1 () "index of {path}")
                   (table () 
                          (tbody ()
                                 (tr () (th () (p () "name"))(th () (p () "last modified"))(th () (p () "creation date"))(th () (p () "size")))
                                 (tr () (th (:colspan "4") (hr)))
                                 "$[for file in $(ls {path}); do echo \"<tr><td><a href=/{path}/$file>$file</a></td><td>$(stat -c %y {path}/$file | head -c 16)</td><td><p>$(stat -c %y {path}/$file | head -c 10)</p></td><td align=right>$(numfmt --to=iec --suffix=B $(stat -c %s {path}/$file))</td></tr>\"; done | sed 's/\\/\\//\\//g']"
                                 (tr () (th (:colspan "4") (hr)))))))))
