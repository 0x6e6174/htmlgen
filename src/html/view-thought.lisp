(defun html ()
  (page "$[test \"$(echo '{' 'thought' '}' | sed 's/ //g')\" != '{thought}' && echo '{thought}' || echo thoughts index]"
        `(section ()
                  "$[echo > /tmp/footnote_count]"
                  (h1 (:style "display: $[test \"$(echo '{' 'thought' '}' | sed 's/ //g')\" != '{thought}' && echo block || echo none]") "$[cat ./html/thoughts/$(basename '{thought}') | grep '<!-- TITLE:' | sed 's/<!-- TITLE://; s/-->//']")
                  "$[cat ./html/thoughts/$(basename '{thought}') | grep '<!-- DATE:' | sed 's/<!-- DATE://; s/-->//']" (br)
                  (div () "$[include \"./html/thoughts/$(basename '{thought}')\"]")
                  "$[test \"$(echo '{' 'thought' '}' | sed 's/ //g')\" != '{thought}' || (echo '<h1>thoughts:</h1>'; ls ./html/thoughts | while read -r file; do echo \"<div>$(cat ./html/thoughts/$file | grep '<!-- DATE:' | sed 's/<!-- DATE://; s/-->//') <a href=?thought=$file>$(cat ./html/thoughts/$file | grep '<!-- TITLE:' | sed 's/<!-- TITLE://; s/-->//')</a></div>\"; done | sort --numeric --reverse)]")))
