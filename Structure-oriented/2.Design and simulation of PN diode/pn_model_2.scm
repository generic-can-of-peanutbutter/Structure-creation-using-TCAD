
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "anode_contact" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "cathode_contact" 4 (color:rgb 1 1 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_n" "Line" (position 1 1 0) (position 2 1 0))
(sdedr:define-refeval-window "RefEvalWin_global" "Rectangle" (position -0.9235 3.8001 0) (position 6.2527 -0.6721 0))

;; Restore GUI session parameters:
(sde:set-window-position 0 27)
(sde:set-window-size 840 800)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Nimbus Sans [UKWN]" "Normal" 8 124 )
