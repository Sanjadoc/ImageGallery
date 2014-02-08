package com.iomull.imageGallery.service 
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.vo.ImagePathVO;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class LoaderAppGallery extends Actor 
	{
		[Inject]
		private var _configModel:	ConfigAppModel;
		
		private var _loader:		LoaderMax;
		private var _xml:			XMLLoader;
		
		public function LoaderAppGallery() 
		{
			 LoaderMax.activate([XMLLoader]);
		}
		
		public function loadData():void
        {           
            var _xml:XMLLoader = new XMLLoader("assets/gallery.xml", 
                                              {name:"galleryXML", 
                                              onComplete:loadCompleteHandler, 
                                              estimatedBytes:1000 } );   
			//MonsterDebugger.trace(this, _xml);
        }

		private function loadCompleteHandler(e:LoaderEvent):void
        {
			var _xml:XMLLoader = e.target as XMLLoader; 
			var _imagesList:XMLList = _xml.content.images.smallImage.bigImage; 
			
			for each (var images:XML in _imagesList) 
			{
				var imagePathVO:ImagePathVO = new ImagePathVO(smallImage.@src,bigImage.@src);                         
				_configModel.pathes.push(ImagePathVO);
			}                        
			//dispatch();   
		}
			
		//events
		private function progressHandler(event:LoaderEvent):void 
		{
			trace("progress: " + event.target.progress);
		}
		 
		private function completeHandler(event:LoaderEvent):void
		{
			trace(event.target + " is complete!");
			//dispatch(assetsEvent);
		}
		  
		private function errorHandler(event:LoaderEvent):void 
		{
			trace("error occured with " + event.target + ": " + event.text);
		}
	}

}