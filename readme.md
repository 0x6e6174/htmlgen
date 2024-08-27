# htmlgen
tool for generating html from lisp code.<br> 
used for natalieee.net.<br>
built around https://gist.github.com/markasoftware/ab357f1b967b3f656d026e33fec3bc0e<br>

## useage
templates/: used for templates<br>
src/: documents in lisp <br>
out/: where html will be written<br>

to compile, run `{clisp,sbcl} gen.lisp`

## example
templates/page.lisp for natalieee.net
```lisp
(load "./templates/header.lsp")
(load "./templates/footer.lsp")

(defun page (title html)
    `(html (:lang "en") 
           (head ()
                 (meta (:http-equiv "content-type" :content "text/html; charset=utf-8"))
                 (meta (:name "viewport" :content "width=device-width, initial-scale=1"))
                 (link (:rel "stylesheet" :href "/style.css"))
                 (title () ,title))
           (body () 
                 ,(header)
                 (main () 
                       ,html)
                 ,(footer))))
```

example page:
```lisp 
; this would have a path of src/example.lisp or similar
(defun html ()
    (page "example" '(h1 () "example")))
```
