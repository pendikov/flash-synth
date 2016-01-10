package music;

/**
 * ...
 * @author Daniil Pendikov
 */
class Scale
{
	public var root:Float = 0;
	/**2 octaves*/
	public var frequencies:Array<Float>;

	public function new(root:Float = 0) 
	{
		this.root = root;
	}
	//1, 2, 3, 4, 5, 6, 7
	public function chord(number:Int):Chord
	{
		var root = frequencies[number-1];
		var third = frequencies[number + 1];
		var fifth = frequencies[number + 3];
		return new Chord([root, third, fifth]);
	}
	
	public static function major(root:Float):Scale
	{
		var frequencies:Array<Float> = [root];
		for (i in 1...24) 
		{
			if (i == 2 || i == 4 || i == 5 || i == 7 || i == 9 || i == 11 ||
				i == 12 || i == 12+2 || i == 12+4 || i == 12+5 || i == 12+7 || i == 12+9 || i == 12+11) 
			{
				var f = root * Math.pow(2, i / 12);
				frequencies.push(f);
				
			}
		}
		var scale = new Scale(root);
		scale.frequencies = frequencies;
		return scale;
	}
	
	public static function minor(root:Float):Scale
	{
		var frequencies:Array<Float> = [root];
		for (i in 1...12) 
		{
			if (i == 2 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 ||
				i == 12 || i == 12+2 || i == 12+3 || i == 12+5 || i == 12+7 || i == 12+8 || i == 12+10) 
			{
				var f = root * Math.pow(2, i / 12);
				frequencies.push(f);
			}
		}
		var scale = new Scale(root);
		scale.frequencies = frequencies;
		return scale;
	}
	
	public function chromatic():Array<Float>
	{
		var frequencies:Array<Float> = [root];
		for (i in 1...12) 
		{
			var f = root * Math.pow(2, i / 12);
			frequencies.push(f);
		}
		return frequencies;
	}
	
}