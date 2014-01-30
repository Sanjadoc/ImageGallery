package com.iomull.imageGallery.signals 
{
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author Oleksandr Grynivsky
	 */
	public class StartupAppSignal extends Signal
	{
		public function StartupAppSignal() 
		{
			super();
			trace('StartupAppSignal test ok!');
		}
		
	}

}