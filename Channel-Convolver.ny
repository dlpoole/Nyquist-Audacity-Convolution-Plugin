;nyquist plug-in
;version 3
;type process
;name "Channel Convolver..."
;action "Convolving..."
;preview "enabled"
;author "Dave Poole"
;copyright "Released under terms of the GNU General Public License version 2" 
;;  v0.1 14-May-2018
;; http://www.gnu.org/copyleft/gpl.html

;control left-input-scale "Input Scale Factors\nLeft channel (%)" float "" 50 0 100
;control right-input-scale "   Right channel (%)" float "" 50 0 100

;; Create list of values from the slider values
(setq channels (list left-input-scale right-input-scale))

; Print settings to debug window	  
(format T "Convolution of:~%Left mix = ~a %~%Right mix = ~a %\n"
(nth 0 channels)(nth 1 channels))

; convert percent to +/- 1
(setf channels (mapcar #'(lambda (num) (/ num 100.0)) channels))

; convolve and output as (two channel monoaural) vector
(if (arrayp s) ; check for stereo track
	(vector
		(convolve
			(mult (aref s 0)(nth 0 channels))
			(mult (aref s 1)(nth 1 channels)))
		(convolve
			(mult (aref s 0)(nth 0 channels))
			(mult (aref s 1)(nth 1 channels))))
; or error if not stereo
	(format NIL "Error\nChannel Convolver convolves stereo channels"))
