package com.iomull.imageGallery.controller.load 
{
	import com.iomull.imageGallery.constant.LoadName;
	import com.iomull.imageGallery.constant.LoadType;
	import com.iomull.imageGallery.model.api.IStateModel;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.vo.ImagePathVO;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import com.iomull.imageGallery.signals.ImagesLoadedSignal;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class SignalParseCompleteCommand extends Command 
	{
		[Inject] public var imagesLoadedSignal	:ImagesLoadedSignal
		[Inject] public var configAppModel		:ConfigAppModel;
		[Inject] public var stateModel			:IStateModel;
		[Inject] public var loaderAppGallery	:LoaderAppGallery;
		
		override public function execute():void
		{
			//trace("SignalParseCompleteCommand");
			
			//initial load content logics
			
			var currentBigImages:Vector.<int> = new Vector.<int>;
			currentBigImages.push(0); // first image
			stateModel.bigImages = currentBigImages;
			
			var currentSmallImages:Vector.<int> = new Vector.<int>;
			var i:int;
			
			for (i = 1; i < configAppModel.pathes.length; i++)
				currentSmallImages.push(i);
			stateModel.smallImages = currentSmallImages;
			
			//load images
			var imagePathVO:ImagePathVO;
			var currentIndex:int;
			
			for (i = 0; i < stateModel.bigImages.length; i++)
			{
				currentIndex = stateModel.bigImages[i]
				imagePathVO = configAppModel.pathes[currentIndex];
				loaderAppGallery.addData(LoadType.IMG, imagePathVO.name, imagePathVO.big);
			}
				
			for (i = 0; i < stateModel.smallImages.length; i++)
			{
				currentIndex = stateModel.smallImages[i]
				imagePathVO = configAppModel.pathes[currentIndex];
				loaderAppGallery.addData(LoadType.IMG, imagePathVO.name, imagePathVO.small);
			}
				
			loaderAppGallery.load(LoadName.IMAGES, imagesLoadedSignal);
		}
		
	}

}