package com.iomull.imageGallery.controller.load 
{
	import com.greensock.loading.display.ContentDisplay;
	import com.iomull.imageGallery.constant.LoadType;
	import com.iomull.imageGallery.model.api.IStateModel;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.ImageModel;
	import com.iomull.imageGallery.model.vo.ImagePathVO;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import com.iomull.imageGallery.signals.LaunchAppSignal;
	import com.iomull.imageGallery.signals.ShowImageSignal;
	import flash.display.Bitmap;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ImagesLoadedCommand extends Command 
	{
		[Inject] public var configAppModel	:ConfigAppModel;
		[Inject] public var stateModel		:IStateModel;
		[Inject] public var loaderAppGallery:LoaderAppGallery;		
		[Inject] public var showImageSignal:ShowImageSignal;
		[Inject] public var imageModel:ImageModel;
		
		override public function execute():void
		{
			//trace("ImagesLoadedCommand");
			
			var index:int;
			index = stateModel.bigImages[stateModel.bigImages.length - 1];
			
			var bigImage:ContentDisplay = loaderAppGallery.getImage(configAppModel.pathes[index].big);
			imageModel.bigImage = bigImage;
			
			var smalImages:Vector.<ContentDisplay> =  new Vector.<ContentDisplay>();
			var smalImage: ContentDisplay;
			for (var i:int = 0; i < stateModel.smallImages.length; i++ )
			{
				index = stateModel.smallImages[i];
				
				smalImage = loaderAppGallery.getImage(configAppModel.pathes[index].small);
				smalImages.push(smalImage);
			}
			
			imageModel.smallImages = smalImages;
			
			
			showImageSignal.dispatch();
		}
		
	}

}