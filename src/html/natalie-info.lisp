(defun html () 
  (page "natalie info" `((section () 
                                  (h1 () "what is a \"natalie\"?")
                                  (span () "I am <a href='/html/natalie-sightings.html'>natalie</a>. obviously.")
                                  (p () "words are not a thing I am good at. this is exacerbaited when the words are about myself. "
                                     "despite this, I shall attempt a suitable description of myself.")
                                  (br)
                                  (p ()
                                  "ideally, I am to be referred to as an \"it\" or a \"she\".",(exec-command "make-footnote \" the former is preferred.\"") "I suppose I may reasonably be described as asexual. " (br)
                                  "timezone I am in: PST/PDT" (br)
                                  "age: $[echo $(( $(date +%s) - $(date -d \"2007-04-01\" +%s) ))] seconds. that is $[echo \"scale=8; ($(date +%s) - $(date -d '2007-04-01' +%s)) / (365.25*24*3600)\" | bc] [earth] years." (br)
                                  "I am kind of a college student. it is complicated. I will be a college student with less complicated circumstances by fall of 2025, barring unforseen circumstances." (br)
                                  "I like systems. particularly ones that have reasonably consistent behavior based on a set of rules. this is omnipresent in my interests." (br)
                                  "list of interests (incomplete):" 
                                  (ul () 
                                      (li () "technical computer things, so long as they do not involve javascript")
                                      (li () "infrastructure, particularly pertaining to trains")
                                      (li () "languistics, especially conlangs")
                                      (li () "key making and lock picking")
                                      (li () "math"))
                                  "things that I enjoy:" 
                                  (ul () 
                                      (li () "friends")
                                      (li () "going on long walks")
                                      (li () "utilizing public transportation")
                                      (li () "train tracks"))
                                  "things that I find displeasing:"
                                  (ul () 
                                      (li () "grease or oil on my skin")
                                      (li () "non friend people") 
                                      (li () "ultraviolet radiation")
                                      (li () "busywork")))
                                  ,(exec-command "put-footnotes"))
                         (section ()
                                  (h2 () "somewhat irregular natalie facts")
                                  (ul () 
                                      (li () "I own 12 thinkpads, all of which were manufactured prior to 2014")
                                      (li () "the number of people that can effectively use my computer is, to my knowledge, 1 (me)" ,(exec-command "make-footnote \"the number of people I know who can type on it is 3, including myself\""))
                                      (li () "I can replace the screen on my first generation iphone se a1662 in 70 seconds"))
                                  ,(exec-command "put-footnotes"))
                         (section () 
                                  (h2 () "contact information")
                                  (a (:href "/html/discord.html") "discord: _natalieeee_")
                                  "email: natalie at natalieee.net" (br) 
                                  "xmpp: nat@natalieee.net")
                         (section () 
                                  (h2 () "some of my computers")
                                  (p () "I own many computers, none of them are normal. particularly notable instances of this phenomenon will be noted below:")
                                  (ul () 
                                      (li () ,(exec-command "make-link /html/my-laptop.html 'my framework 16'")
                                      (li () ,(exec-command "make-link /html/my-old-laptop.html 'my old {w,t}530'"))
                                      (li () ,(exec-command "make-link /html/server-migration.html 'the server this runs on'"))))))))
