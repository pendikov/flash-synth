package synth.instruments;
import synth.Instrument;
import synth.NoiseOscillator;
import synth.SineOscillator;
import synth.SquareOscillator;

/**
 * ...
 * @author Daniil Pendikov
 */
class Snare extends Instrument
{

	public function new() 
	{
		super();
		oscillators.push(new NoiseOscillator());
		oscillators.push(new NoiseOscillator());
		oscillators.push(new SquareOscillator());
		
		envelope.attackTime = 0.0001;
		envelope.decayTime = 0.4;
		envelope.releaseTime = 0;

		envelope.attackMaxValue = 0.9;
		envelope.sustainMaxValue = 0.0;
		
		oscillators[0].amplitude = 0.3;
		oscillators[1].amplitude = 0.1;
		oscillators[2].amplitude = 0;
	}
	
}