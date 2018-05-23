# Nyquist-Audacity-Convolution-Plugin

This plug-in convolves the two channels of a selection from a stereo track.  The convolution overwrites both channels of the source  track.  

A typical application is Auralization - placing a monaural audio sample in one channel and an impulse response in the other representing a reverberant environment into which the sample is to be placed. This can simulate a performance of an anechoic or studio recording in reverberant space, but cannot generally deconvolve a reverberated field recording to remove echoes. See https://en.wikipedia.org/wiki/Deconvolution. The quality of an auralization depends on the quality of the impulse and will be unique to the conditions under which it was captured.

There are SIGNIFICANT limitations:

Audacity imposes a memory limit on the Nyquist convolve function; experimentally, this results in a 20 second limit on the selection at 48KHz sample rate.  Attempts to convolve longer selections will throw a table limit error that will be found in the Debug window.

Audacity applies a common selection to both channels of a stereo track and delivers them as inputs to convolve. It will probably be necessary to prepare a monaural track of the impulse response (post-padded with silence if necessary) and a second monaural track of the desired audio from which to make a stereo track to convolve. It is wise to make backup WAV copies of the source naterials before pressing OK on this or any other effect or filter lest it cause Audacity to crash.

This plugin took 8 minutes to convolve a 10-second audio selection and impulse function at 48KHz sampling rate with Audacity v.2.2.1 on a Dell laptop with an i7-5600U CPU.  Nyquist v.3.12 reportedly has a new "fast convolution" primitive which is capable of convolution in near real-time and which may be incorporated into future versions of Audacity.

Convolution is subject to overflow, so you may wish to set the input coefficients to 50%, convolve a short but high amplitude portion of your source material, and select lower input coefficients to avoid clipping before you commit to a 15-minute run. You can always UNDO a clipped result to get your raw material back for another try.  Attempts to convolve a monaural track, convolve between tracks, or convolve selections with unmatched sample rates will also throw an error.

Audacity forces both the sample and impulse to the length of the selection, so the convolved track will have twice the length of the original selection so as to contain the "tail" of the impulse response. 

It is wise to make safety WAV copies of your source materials before using this or any other effect or filter as doing so can cause Audacity to crash.
