package synth.filters;

/**
 * ...
 * @author Daniil Pendikov
 */
class LowPass implements IFilter
{
	private var _ip:Float = 0.0;
	private var _ipp:Float = 0.0;
	private var _op:Float = 0.0;
	private var _opp:Float = 0.0;
	
	private var _a0:Float = 0.0;
	private var _a1:Float = 0.0;
	private var _a2:Float = 0.0;
	private var _b0:Float = 0.0;
	private var _b1:Float = 0.0;	
	
	private var c:Float;
	
	public var sampleRate:Float = 44100;
	var _cutoff:Float = 1000;
	public var cutoff(get, set):Float;//13000;
	public function get_cutoff()
	{
		return _cutoff;
	}
	public function set_cutoff(value:Float)
	{
		if (value > 0 && value < sampleRate / 2) 
		{
			_cutoff = value;
			recalculateParams();
		}		
		return _cutoff;
	}
	var _reso:Float = Math.sqrt(2);//1.1
	public var reso(get, set):Float;//1.1
	public function get_reso()
	{
		return _reso;
	}
	
	public function set_reso(value:Float)
	{
		if (value > 0 && value < 1.4) 
		{
			_reso = value;
			recalculateParams();
		}
		
		return _reso;
	}
	
	public function recalculateParams()
	{
		var r = reso;
		var temp = 1.0 / Math.tan(Math.PI * cutoff / sampleRate/2);
		
		if (!Math.isFinite(temp)) 
		{
			trace("LOWPASS INFINITY ERROR");
			return;
		}
		c = temp;

		_a0 = 1.0 / ( 1.0 + r * c + c * c);
		_a1 = 2.0* _a0;
		_a2 = _a0;
		_b0 = 2.0 * ( 1.0 - c*c) * _a0;
		_b1 = ( 1.0 - r * c + c * c) * _a0;
	}

	public function new() 
	{
		recalculateParams();
	}
	
	public function process(input:Float):Float {	
	
		var out:Float = _a0 * input +
						 _a1 * _ip +
						 _a2 * _ipp 
						 -_b0 * _op 
						 -_b1 * _opp;
		_ipp = _ip;
		_ip = input;
		_opp = _op;
		_op = out;			
		return out;
	}
}