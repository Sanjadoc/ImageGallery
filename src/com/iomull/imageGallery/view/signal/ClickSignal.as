package com.iomull.imageGallery.view.signal 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ClickSignal extends Signal 
	{
		public function ClickSignal() 
		{
			super(String);
		}
	}
}