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
			trace("ImagesLoadedCommand@");
			
			var bigImage: ContentDisplay = loaderAppGallery.getImage(configAppModel.pathes[0].name);
			
			imageModel.bigImage = bigImage;
			
			showImageSignal.dispatch();
		}
		
	}

}