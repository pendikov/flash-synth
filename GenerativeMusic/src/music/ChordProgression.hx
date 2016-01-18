package music;

/**
 * ...
 * @author ...
 */
class ChordProgression
{

	public function new() 
	{
		
	}
	
	public function random():Array<Int> {
		var first = Std.int(Math.random() * 7) + 1;
		var chords:Array<Int> = [first];
		for (i in 0...16) 
		{
			chords.push(next(chords[chords.length-1]));
		}
		trace(chords);
		return chords;
	}
	
	public function next(number:Int):Int {
		//most likely 3
		//less likely 2
		//least likely 1
		var possible:Array<Int> = [1, 2, 3, 4, 5, 6, 7];
		var probabilities:Map<Int, Float> = new Map<Int, Float>();
		probabilities[1] = 0;
		probabilities[2] = 0;
		probabilities[3] = 0;
		probabilities[4] = 0;
		probabilities[5] = 0;
		probabilities[6] = 0;
		probabilities[7] = 0;
		switch (number) {
			case 1:
				var one = 1 / (3+3+2+1+1);
				probabilities[4] = 3*one;
				probabilities[5] = 3*one;
				probabilities[6] = 2*one;
				probabilities[2] = 1*one;
				probabilities[3] = 1*one;
			case 2:
				var one = 1 / (3+2+2+1+1);
				probabilities[5] = 3*one;
				probabilities[4] = 2*one;
				probabilities[6] = 2*one;
				probabilities[1] = 1*one;
				probabilities[3] = 1*one;
			case 3:
				var one = 1 / (3+2+1+1+1);
				probabilities[6] = 3*one;
				probabilities[4] = 2*one;
				probabilities[1] = 1*one;
				probabilities[2] = 1*one;
				probabilities[5] = 1*one;
			case 4:
				var one = 1 / (3+2+2+1+1);
				probabilities[5] = 3*one;
				probabilities[1] = 2*one;
				probabilities[2] = 2*one;
				probabilities[3] = 1*one;
				probabilities[6] = 1*one;
			case 5:
				var one = 1 / (3+2+2+1+1);
				probabilities[1] = 3*one;
				probabilities[4] = 2*one;
				probabilities[6] = 2*one;
				probabilities[2] = 1*one;
				probabilities[3] = 1*one;
			case 6:
				var one = 1 / (3+3+2+2+1);
				probabilities[2] = 3*one;
				probabilities[5] = 3*one;
				probabilities[3] = 2*one;
				probabilities[4] = 2*one;
				probabilities[1] = 1*one;
			case 7:
				probabilities[1] = 1;
		}
		var random = Math.random();
		var sum:Float = 0;
		var allPossible:Array<Int> = [];
		for (key in probabilities.keys()) 
		{
			if (probabilities[key] > 0) 
			{
				allPossible.push(key);
			}
			sum += probabilities[key];
			if (random < sum) 
			{
				//return key;
			}
		}
		return Std.int(Math.random() * 7 + 1);
		return allPossible[Std.int(Math.random()*allPossible.length)];
		return 1;
	}
	
}