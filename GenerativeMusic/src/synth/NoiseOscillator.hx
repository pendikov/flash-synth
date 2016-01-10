package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class NoiseOscillator extends Oscillator
{

	public function new() 
	{
		super();
	}
	//Math.random() * 2 - 1;
	
	public override function left(frequency:Float, position:Int):Float
	{
		//var phase = frequency * ((phaseShift + leftPhaseShift + position) / rate * period);
		return (Math.random() * 2 - 1) * amplitudeLeft;
	}
	
	public override function right(frequency:Float, position:Int):Float
	{
		//var phase = frequency * ((phaseShift + rightPhaseShift + position) / rate * period);
		return (Math.random() * 2 - 1) * amplitudeRight;
	}
}