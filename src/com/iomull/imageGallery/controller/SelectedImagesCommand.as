package com.iomull.imageGallery.controller 
{
	import com.iomull.imageGallery.model.api.IStateModel;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.ImageModel;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class SelectedImagesCommand extends Command 
	{
		[Inject] public var stateModel:IStateModel;
		[Inject] public var configAppModel	:ConfigAppModel;
		[Inject] public var loaderAppGallery:LoaderAppGallery;	
		[Inject] public var imageModel:ImageModel;
		
		override public function execute():void
		{
			trace("SelectedImagesCommand " + stateModel.selectedName);
			//trace("imageModel.bigImage.name " + imageModel.bigImage.name);
		
		}
		
	}

}