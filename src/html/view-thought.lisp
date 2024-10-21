(defun html ()
  (page "$[test \"$(echo '{' 'thought' '}' | sed 's/ //g')\" != '{thought}' && echo '{thought}' || echo thoughts index]"
        `(section ()
                  (h1 (:style "display: $[test \"$(echo '{' 'thought' '}' | sed 's/ //g')\" != '{thought}' && echo block || echo none]") "$[cat ./html/thoughts/$(basename '{thought}') | grep '<!-- TITLE:' | cut -d ':' -f2 | sed 's/-->//']")
                  "$[cat ./html/thoughts/$(basename '{thought}') | grep '<!-- DATE:' | sed 's/<!-- DATE://; s/-->//']" (br)
                  (div () "$[include ./html/thoughts/$(basename '{thought}')]")
                  "$[test \"$(echo '{' 'thought' '}' | sed 's/ //g')\" != '{thought}' || (echo '<h1>thoughts:</h1>'; ls ./html/thoughts | while read -r file; do echo \"<p>$(cat ./html/thoughts/$file | grep '<!-- DATE:' | sed 's/<!-- DATE://; s/-->//') <a href=?thought=$file>$file</a></p>\"; done | sort --numeric --reverse)]")))
