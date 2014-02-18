package com.iomull.imageGallery.controller.load 
{
	import com.iomull.imageGallery.constant.LoadName;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.service.LoaderAppGallery;
	import org.robotlegs.mvcs.Command;
	/**
	 * ...
	 * @author  Oleksandr Grynivskyi
	 */
	public class ImageXMLLoadedCommand extends Command 
	{
		[Inject] public var loaderAppGallery:	LoaderAppGallery;
		[Inject] public var configAppModel:		ConfigAppModel;
		
		override public function execute():void
		{
			trace("ImageXMLLoadedCommand");
			const imageXML: XML = loaderAppGallery.getXML(LoadName.IMAGE_XML);		
			loaderAppGallery.dispose();												//memory cleaning								
			configAppModel.parseXML(imageXML);									
		}
	}

}