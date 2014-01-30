package com.iomull.imageGallery.signals 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class LaunchAppSignal extends Signal 
	{
		public function LaunchAppSignal() 
		{
			super();
			trace("LaunchAppSignal ok!");
		}
	}

}