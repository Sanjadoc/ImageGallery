package com.iomull.imageGallery.service
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.iomull.imageGallery.constant.LoadType;
	import flash.utils.Dictionary;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class LoaderAppGallery extends Actor
	{
		private var _loader:LoaderMax;
		private var _signalMap:Dictionary;
		
		public function LoaderAppGallery()
		{
			_loader = new LoaderMax({name: "loaderAppGallery", onProgress: progressHandler, onComplete: completeHandler, onError: errorHandler});
			_signalMap = new Dictionary();
		}
		
		public function addData(type:String, name:String, url:String, signal:Signal=null):void
		{
			if (signal)
				_signalMap[name] = signal;
			
			if (type == LoadType.XML)
				_loader.append(new XMLLoader(url, {name: name, onComplete: completeXMLHandler, autoDispose : true}));
			else if (type == LoadType.IMG)
				_loader.append(new ImageLoader(url, {name: name, onComplete: completeIMGHandler, autoDispose : true}));
		}
		
		public function load():void
		{
			_loader.load();
		}
		
		public function getXML(name:String):XML  
		{
			const xml:XML = _loader.getContent(name) as XML
			return xml;
		}
		
		//public function getImage(name:String):XML  
		//{
			//const xml:XML = _loader.getContent(name) as XML
			//return xml;
		//}
		
		private function completeXMLHandler(e:LoaderEvent):void
		{
			trace(e.target + " is complete!");
			
			var signal:Signal = _signalMap[e.target.name]
			if (signal)
				signal.dispatch();
		}
		
		private function completeIMGHandler(e:LoaderEvent):void
		{
			trace(e.target + " is complete!");
			
			var signal:Signal = _signalMap[e.target.name]
			if (signal)
				signal.dispatch();
		}
		
		private function progressHandler(e:LoaderEvent):void
		{
			trace("progress: " + e.target.progress);
		}

		private function completeHandler(e:LoaderEvent):void
		{
			trace(e.target + " is complete!");
		}
		
		private function errorHandler(e:LoaderEvent):void
		{
			trace("error occured with " + e.target + ": " + e.text);
		}
	
	}

}