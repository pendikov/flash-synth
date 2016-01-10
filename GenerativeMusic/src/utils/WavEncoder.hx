package utils;
import openfl.utils.ByteArray;
import openfl.utils.Endian;

/**
 * ...
 * @author Daniil Pendikov
 */
class WavEncoder
{
	private static var RIFF:String = "RIFF";	
	private static var WAVE:String = "WAVE";	
	private static var FMT:String = "fmt ";	
	private static var DATA:String = "data";	
	
	private var _bytes:ByteArray = new ByteArray();
	private var _buffer:ByteArray = new ByteArray();
	private var _volume:Float;
	
	public function new( volume:Float = 0)
	{
		_volume = Math.PI / 2; 
	}
	
	public function encode( samples:ByteArray, channels:Int=2, bits:Int=16, rate:Int=44100 ):ByteArray
	{
		var data:ByteArray = create( samples );
		
		_bytes.length = 0;
		_bytes.endian = Endian.LITTLE_ENDIAN;
		
		_bytes.writeUTFBytes( WavEncoder.RIFF );
		_bytes.writeInt( data.length );
		_bytes.writeUTFBytes( WavEncoder.WAVE );
		_bytes.writeUTFBytes( WavEncoder.FMT );
		_bytes.writeInt( 16 );
		_bytes.writeShort( 1 );
		_bytes.writeShort( channels );
		_bytes.writeInt( rate );
		_bytes.writeInt( rate * channels * ( bits >> 3 ) );
		_bytes.writeShort( channels * ( bits >> 3 ) );
		_bytes.writeShort( bits );
		_bytes.writeUTFBytes( WavEncoder.DATA );
		_bytes.writeInt( data.length );
		_bytes.writeBytes( data );
		_bytes.position = 0;
		
		return _bytes;
	}
	
	function create( bytes:ByteArray ):ByteArray
	{
		_buffer.endian = Endian.LITTLE_ENDIAN;
		_buffer.length = 0;
		bytes.position = 0;
		
		while( bytes.bytesAvailable > 0 ) 
			_buffer.writeShort( Std.int(bytes.readFloat() * (0x7fff * _volume)) );
		return _buffer;
	}
	
}