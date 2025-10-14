
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "Gate" 4 (color:rgb 1 0 0 )"##" )
(sdegeo:define-contact-set "Body" 4 (color:rgb 1 0 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "RefEvalWin_1" "Rectangle" (position -0.5 -0.05 0) (position 3.5 0.65 0))
(sdedr:define-refeval-window "RefEvalWin_1" "Rectangle" (position -0.5 -0.05 0) (position 3.5 0.65 0))

;; Restore GUI session parameters:
(sde:set-window-position 0 27)
(sde:set-window-size 1920 983)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Nimbus Sans [UKWN]" "Normal" 8 124 )
