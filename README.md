# Nyquist-Audacity-Convolution-Plugin

This plug-in convolves the two channels of a selection from a stereo track.  The typical application is for one channel to contain a monaural audio sample and the other an impulse function representing a reverberant environment into which it is to be placed. 
Note that the Nyquist (convolve( function used is not a fast one and it is subject to memory limits.  This plugin was able to convolve a 10-second audio selection and impulse function at 48KHz sampling rate in about 8 minutes  on a Dell laptop with an i5-5200U CPU. 
Convolution is subject to overflow, so you may wish to set the input coefficients to 50% and convolve a short but representative selection of your material and adjust the input coefficients as necessary before you commit.  You can always undo a clipped result in order to get your raw material back for another try.
Attempts to convolve larger selections will throw a table limit error that can be seen in the Debug window.  Attempts to convolve a monaural track, convolve between tracks, or convolve selections with unmatched sample rates will also error.
A successful convolution is placed in both channels of the source track.
