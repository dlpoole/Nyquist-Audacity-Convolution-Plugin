# Nyquist-Audacity-Convolution-Plugin

This plug-in convolves the two channels of a selection from a stereo track.  The convolution overwrites both channels of the source  track.  A typical application is for one channel to contain a monaural audio sample and the other an impulse response representing a reverberant environment into which it is to be placed.

There are SIGNIFICANT limitations:
Audacity imposes a memory limit on the Nyquist convolve function; experimentally, this results in a 20 second limit on the selection at 48KHz sample rate.  Attempts to convolve longer selections will throw a table limit error that will be found in the Debug window.

Audacity applies a common selection to both channels of a stereo track and delivers them as inputs to convolve. It will probably be necessary to prepare a monaural track of the impulse response (post-padded with silence if necessary) and a second monaural track of the desired audio from which to make a stereo track to convolve.

This plugin took 8 minutes to convolve a 10-second audio selection and impulse function at 48KHz sampling rate on a Dell laptop with an i5-5200U CPU.

Convolution is subject to overflow, so you may wish to set the input coefficients to 50%, convolve a short but high amplitude portion of your source material, and select lower input coefficients to avoid clipping before you commit to a 15-minute run. You can always UNDO a clipped result to get your raw material back for another try.  Attempts to convolve a monaural track, convolve between tracks, or convolve selections with unmatched sample rates will also throw an error.

Audacity forces both the sample and impulse to the length of the selection, so the convolved track will have twice the length of the original selection so as to contain the "tail" of the impulse response. 
