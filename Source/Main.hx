import lime.Lime;

import haxe.Timer;

import Matrix4;

class Main 
{
	
	private var lime:Lime;


	public function new () {}
	
	public function ready (lime:Lime) : Void 
	{
	}

	private function render () : Void
	{
		var currentTime = Timer.stamp();

		var mat1 = new Matrix4();
		mat1.setIdentity();
		var mat2 = new Matrix4();
		mat2.set2D(123, 123, 1.5, 123);

		for(i in 0...100000)
		{
			mat1.multiply(mat2);
		}

		trace("took:" + ((Timer.stamp() - currentTime) * 1000));

	}

}