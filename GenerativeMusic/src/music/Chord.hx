package music;

/**
 * ...
 * @author Daniil Pendikov
 */
class Chord
{
	var root:Array<Float>;

	public function new(root:Array<Float>) 
	{
		this.root = root;
	}
	
	public function bestInversion(chord:Array<Float>=null, numNotes:Int = 3):Array<Float>
	{
		var notes:Array<Float> = [];
		for (i in 3...numNotes+3) 
		{
			var upOctave = Std.int((i-2) / 3);
			notes[i] = root[(i-2) % 3] * Math.pow(2, upOctave);
		}
		notes[0] = notes[3] / 2;
		notes[1] = notes[4] / 2;
		notes[2] = notes[5] / 2;
		
		if (chord == null || chord.length == 0) {
			//by default return first inversion
			return notes.splice(2, numNotes);
		}
		var closest:Float = 9999999;
		var closestI:Int = 0;
		for (i in 0...4) 
		{
			var f1 = notes[i];
			for (j in 0...chord.length) 
			{
				var f2 = chord[j];
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
	
	
	
}