package com.iomull.imageGallery.controller 
{
	import com.greensock.loading.display.ContentDisplay;
	import com.iomull.imageGallery.constant.LoadName;
	import com.iomull.imageGallery.constant.LoadType;
	import com.iomull.imageGallery.model.api.IStateModel;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.ImageModel;
	import com.iomull.imageGallery.model.vo.ImagePathVO;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import com.iomull.imageGallery.signals.ImagesLoadedSignal;
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
		[Inject] public var imagesLoadedSignal	:ImagesLoadedSignal
		
		override public function execute():void
		{
			//trace("SelectedImagesCommand " + stateModel.selectedName);
			
			//newBig load images
			var i:int;
			var newBigImage:ImagePathVO;
			var currentBigImages:Vector.<int> = new Vector.<int>;
			var currentSmallImages:Vector.<int> = new Vector.<int>;
			var currentIndex:int;
				
			for (i = 0; i < configAppModel.pathes.length; i++) 
			{
				if (configAppModel.pathes[i].name == stateModel.selectedName) 
				{
					currentIndex = i;
					currentBigImages.push(currentIndex);
					stateModel.bigImages = currentBigImages;
					
					newBigImage = configAppModel.pathes[currentIndex];
					loaderAppGallery.addData(LoadType.IMG, newBigImage.name, newBigImage.big);
					break;
				}			
			}
				
			//newSmall load images
			var imagePathVO:ImagePathVO;
			var newSmallIndex:int;
			
			var smallImages:Vector.<ImagePathVO> = configAppModel.pathes.slice();
			for (i = 0; i < stateModel.smallImages.length; i++)
			{
				smallImages[ stateModel.smallImages[i] ] = null;
			}
			
			for (i = 0; i < smallImages.length; i++)
			{
				if (smallImages[i])
					newSmallIndex = i;
			}
			
			for (i = 0; i < stateModel.smallImages.length; i++)
			{
				if (stateModel.smallImages[i] == currentIndex)
					stateModel.smallImages.splice(i, 1, newSmallIndex);
			}
			
			imagePathVO = configAppModel.pathes[newSmallIndex];
			loaderAppGallery.addData(LoadType.IMG, imagePathVO.name, imagePathVO.small);
			
			//load images
			loaderAppGallery.load(LoadName.IMAGES, imagesLoadedSignal);
		}
	}
}