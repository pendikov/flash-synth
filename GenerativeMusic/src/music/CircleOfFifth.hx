package music;

/**
 * ...
 * @author Daniil Pendikov
 */
class CircleOfFifth
{
	public var root:Float = 0;
	var scale:Scale;
	
	public var major:Array<Float>;	
	public var minor:Array<Float>;

	public function new(root:Float = 0) 
	{
		this.root = root;
		scale = new Scale(root);
		createMajor();
		createMinor();
	}
	
	function createMajor() {
		var scale = scale.chromatic();
		var circle:Array<Float> = [root];
		var currentPosition:Int = 0;
		
		for (i in 1...12) 
		{
			if (currentPosition + 7 < scale.length) 
			{
				currentPosition += 7;
				circle.push(scale[currentPosition]);
			} else {
				var temp = scale.length - currentPosition;
				currentPosition = 7 - temp;
				circle.push(scale[currentPosition]);
			}
		}
		this.major = circle;
	}
	
	function createMinor() {
		var minorRoot = root * Math.pow(2, -3 / 12);
		var scale = new Scale(minorRoot).chromatic();
		var circle:Array<Float> = [root];
		var currentPosition:Int = 0;
		
		for (i in 1...12) 
		{
			if (currentPosition + 7 < scale.length) 
			{
				currentPosition += 7;
				circle.push(scale[currentPosition]);
			} else {
				var temp = scale.length - currentPosition;
				currentPosition = 7 - temp;
				circle.push(scale[currentPosition]);
			}
		}
		this.minor = circle;
	}
	
}