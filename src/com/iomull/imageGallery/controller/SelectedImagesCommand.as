package com.iomull.imageGallery.controller 
{
	import com.greensock.loading.display.ContentDisplay;
	import com.iomull.imageGallery.constant.LoadName;
	import com.iomull.imageGallery.constant.LoadType;
	import com.iomull.imageGallery.model.api.IStateModel;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.ImageModel;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import com.iomull.imageGallery.signals.ImageXMLLoadedSignal;
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
		[Inject] public var imageXMLLoadedSignal:ImageXMLLoadedSignal;
		
		override public function execute():void
		{
			trace("SelectedImagesCommand " + stateModel.selectedName);
			
			//load new big image
			
		}
		
	}

}