package music;

/**
 * ...
 * @author Daniil Pendikov
 */
class ChordBuilder
{
	public var root:Float = 0;

	public function new(root:Float = 0) 
	{
		this.root = root;
	}
	
	public function closestInversion(previous:Array<Float>, chord:Array<Float>, numNotes:Int = 3)
	{		
		var notes:Array<Float> = [];
		for (i in 2...numNotes+2) 
		{
			var upOctave = Std.int((i-2) / 3);
			notes[i] = chord[(i-2) % 3] * Math.pow(2, upOctave);
		}
		notes[0] = notes[3] / 2;
		notes[1] = notes[4] / 2;
		
		if (previous == null || previous.length == 0) {
			//by default return first inversion
			return notes.splice(1, numNotes);
		}
		var closest:Float = 9999999;
		var closestI:Int = 0;
		for (i in 0...3) 
		{
			var f1 = notes[i];
			for (j in 0...previous.length) 
			{
				var f2 = previous[j];
				var distance = Math.abs(f2 - f1);
				if (distance < closest) 
				{
					closest = distance;
					closestI = i;
				}
			}
		}
		return notes.splice(closestI, numNotes);
	}
	
	public function major(previous:Array<Float>, numNotes:Int = 3):Array<Float>
	{
		var second = root / 4 * 5;
		var third = root / 4 * 6;
		return closestInversion(previous, [root, second, third], numNotes);
	}
	
	public function minor(previous:Array<Float>, numNotes:Int = 3):Array<Float>
	{
		var second = root / 10 * 12;
		var third = root / 10 * 15;
		return closestInversion(previous, [root, second, third], numNotes);
	}
	
	public function majorRoot():Array<Float>
	{
		var second = root / 4 * 5;
		var third = root / 4 * 6;
		return [root, second, third];
	}
	
	public function minorRoot():Array<Float>
	{
		var second = root / 10 * 12;
		var third = root / 10 * 15;
		return [root, second, third];
	}
	
	//Diminished	3-3	160:192:231
	public function diminishedRoot():Array<Float>
	{
		var second = root / 160 * 192;
		var third = root / 160 * 231;
		return [root, second, third];
	}
	
	//7th	4-3-3	20:25:30:36
	public function seventhRoot():Array<Float>
	{
		var second = root / 20 * 25;
		var third = root / 20 * 30;
		var fourth = root / 20 * 36;
		return [root, second, third, fourth];
	}
	//Maj. 7th	4-3-4	8:10:12:15
	public function majorSeventhRoot():Array<Float>
	{
		var second = root / 8 * 10;
		var third = root / 8 * 12;
		var fourth = root / 8 * 15;
		return [root, second, third, fourth];
	}
	//Min. 7th	3-4-3	10:12:15:18
	public function minorSeventhRoot():Array<Float>
	{
		var second = root / 10 * 12;
		var third = root / 10 * 15;
		var fourth = root / 10 * 18;
		return [root, second, third, fourth];
	}
	
}