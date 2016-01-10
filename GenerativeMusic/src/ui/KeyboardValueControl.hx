package ui;

/**
 * ...
 * @author Daniil Pendikov
 */
class KeyboardValueControl extends KeyboardControls
{
	var lowerKey:Int = 0;
	var upperKey:Int = 0;
	public var lowerFunction:Void->Void;
	public var upperFunction:Void->Void;

	public function new(lowerKey:Int, upperKey:Int) 
	{
		super();
		this.lowerKey = lowerKey;
		this.upperKey = upperKey;
	}
	
	public override function keyDown(key:Int)
	{
		if (key == lowerKey) 
		{
			if (lowerFunction != null) 
			{
				lowerFunction();
			}
		}
		if (key == upperKey) 
		{
			if (upperFunction != null) 
			{
				upperFunction();
			}
		}
	}
	
	public override function keyUp(key:Int)
	{
	
	}
	
}