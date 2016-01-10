package synth;

/**
 * ...
 * @author Daniil Pendikov
 */
class Envelope
{
	public var attackTime:Float = 0;
	public var decayTime:Float = 0;
	public var releaseTime:Float = 0;
	
	public var attackMaxValue:Float = 0;
	public var sustainMaxValue:Float = 0;
	public var samplesPerTick:Int = 6963;

	public function new() 
	{
		
	}
	
	function mono(wave:Float, position:Int, startPosition:Int, duration:Int):Float {
		
		var attackStart = 0;
		var decayStart = attackTime * samplesPerTick;
		var sustainStart = (attackTime + decayTime) * samplesPerTick;
		var releaseStart = duration;
		var attackTime = this.attackTime * samplesPerTick;
		var decayTime = this.decayTime * samplesPerTick;
		var releaseTime = this.releaseTime * samplesPerTick;
		
		if (position < attackTime) 
		{
			var t:Float = position / attackTime;
			return wave * t * attackMaxValue;
		}
		if (position < decayStart + decayTime) 
		{
			var t:Float = decayTime == 0 ? 1 : (position - decayStart) / decayTime;
			return wave * (attackMaxValue - t * (attackMaxValue-sustainMaxValue));
		}
		if (position < duration) 
		{
			return wave * sustainMaxValue;
		}
		if (position < releaseStart + releaseTime) 
		{
			var t:Float = releaseTime == 0 ? 1 : (position - releaseStart) / releaseTime;
			return wave * (1-t) * sustainMaxValue;
		} 
		return 0;
	}
	
	public function left(wave:Float, position:Int, startPosition:Int, duration:Int):Float
	{
		return mono(wave, position, startPosition, duration);
	}
	
	public function right(wave:Float, position:Int, startPosition:Int, duration:Int):Float
	{
		return mono(wave, position, startPosition, duration);
	}
	
}