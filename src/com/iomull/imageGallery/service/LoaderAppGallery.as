package com.iomull.imageGallery.service
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.greensock.TweenLite;
	import com.iomull.imageGallery.constant.LoadName;
	import com.iomull.imageGallery.constant.LoadType;
	import flash.display.Bitmap;
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
			_loader = new LoaderMax({name: LoadName.LOADER, onProgress: progressHandler, onComplete: completeHandler, onError: errorHandler});
			_signalMap = new Dictionary();
		}
		
		public function addData(type:String, name:String, url:String, signal:Signal=null):void
		{	
			mapSignal(name, signal);
			
			if (type == LoadType.XML)
				_loader.append(new XMLLoader(url, {name: name, onComplete: completeContectHandler, autoDispose : false}));
			else if (type == LoadType.IMG)
				_loader.append(new ImageLoader(url, {name: name, onComplete: completeContectHandler, autoDispose : false}));
		}
		
		public function load(name:String= null, signal:Signal=null):void
		{
			if (name)
				_loader.name = name;
			mapSignal(name, signal);
			_loader.load();
		}
		
		public function getXML(name:String):XML  
		{
			const xml:XML = _loader.getContent(name) as XML
			return xml;
		}
		
		public function getImage(name:String):ContentDisplay  
		{
			const image:ContentDisplay = _loader.getContent(name) as ContentDisplay;
			return image;
		}
		
		public function dispose():void
		{
			//_loader.dispose(true);
			//_signalMap = new Dictionary();
			_loader.unload();
		}
		
		private function mapSignal(name:String= null, signal:Signal=null):void
		{
			if (name && signal)
			{
				if (_signalMap[name])
					_signalMap[name] = null;
				_signalMap[name] = signal;
			}
		}
		
		private function completeHandler(e:LoaderEvent):void
		{
			trace(e.target + " is complete!");
			
			var signal:Signal = _signalMap[e.target.name]
			if (signal)
				signal.dispatch();
		}
		
		private function completeContectHandler(e:LoaderEvent):void
		{
			//trace(e.target + " is complete!");
			
			var signal:Signal = _signalMap[e.target.name]
			if (signal)
				signal.dispatch();
		}
		
		private function progressHandler(e:LoaderEvent):void
		{
			//trace("progress: " + e.target.progress);
		}
		
		private function errorHandler(e:LoaderEvent):void
		{
			trace("error occured with " + e.target + ": " + e.text);
		}
	
	}

}