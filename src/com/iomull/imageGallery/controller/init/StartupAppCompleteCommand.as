package com.iomull.imageGallery.controller.init 
{
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author Oleksandr Grynivsky
	 */
	public class StartupAppCompleteCommand extends SignalCommand 
	{
		//[Inject] public var configModel		:ConfigModel;
		
		override public function execute():void
		{
			trace("StartupAppCompleteCommand ok");
		}
		
	}

}