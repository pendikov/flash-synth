package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class SquareOscillator extends Oscillator
{

	public function new() 
	{
		super();
	}
	
	public override function left(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + position) / rate * period);
		return Math.sin(phase) > 0 ? amplitudeLeft : -amplitudeLeft;
	}
	
	public override function right(frequency:Float, position:Int):Float
	{
		var phase = frequency * ((phaseShift + rightPhaseShift + position) / rate * period);
		return Math.sin(phase) > 0 ? amplitudeRight : -amplitudeRight;
	}
	
}