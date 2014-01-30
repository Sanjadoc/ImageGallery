package com.iomull.imageGallery.controller.init 
{
	import com.iomull.imageGallery.model.ViewAppModel;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Olexandr Grynivsky
	 */
	public class LaunchAppCommand extends Command 
	{
		[Inject]
		public var viewAppModel:ViewAppModel;
		
		override public function execute():void
		{
			viewAppModel.createApplication(contextView);
			viewAppModel.addBuildVersionLayer();
		}
		
	}

}