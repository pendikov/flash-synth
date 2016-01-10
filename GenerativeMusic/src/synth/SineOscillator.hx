package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class SineOscillator extends Oscillator
{

	public function new() 
	{
		super();
	}
	
	public override function left(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + leftPhaseShift + position) / rate * period);
		return Math.sin(phase) * amplitudeLeft;
	}
	
	public override function right(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + rightPhaseShift + position) / rate * period);
		return Math.sin(phase) * amplitudeRight;
	}
	
}