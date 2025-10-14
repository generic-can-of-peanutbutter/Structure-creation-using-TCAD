
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "gate" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "source" 4 (color:rgb 1 1 0 )"##" )
(sdegeo:define-contact-set "drain" 4 (color:rgb 1 1 1 )"##" )
(sdegeo:define-contact-set "substrate" 4 (color:rgb 1 0 1 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_all" "Rectangle" (position -0.0555 -0.029 0) (position 1.5507 0.7345 0))
(sdedr:define-refeval-window "RefEvalWin_channel" "Rectangle" (position 0.15 -0.005 0) (position 1.35 0.1 0))

;; Restore GUI session parameters:
(sde:set-window-position 668 210)
(sde:set-window-size 840 800)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Nimbus Sans [UKWN]" "Normal" 8 124 )
