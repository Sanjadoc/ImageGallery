package com.iomull.imageGallery.model 
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.iomull.imageGallery.model.vo.ImagePathVO;
	import com.iomull.imageGallery.signals.SignalParseComplete;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ConfigAppModel extends Actor 
	{
		public var xmlPath:		String = "../assets/gallery.xml";
		
		public var pathes:Vector.<ImagePathVO>;
		
		[Inject]
		public var signalParseComplete:SignalParseComplete;
		
		public function ConfigAppModel() 
		{
		
		}
		
		public function parseXML(imageXML:XML): void
		{
			pathes = new Vector.<ImagePathVO>();
			
			const imageXMLList:XMLList = imageXML.children();
			
			for each (var image:XML in imageXMLList) 
			{
				var imagePathVO:ImagePathVO = new ImagePathVO( image.@name, image.@small, image.@big );
				pathes.push(imagePathVO);	
			}
			
			signalParseComplete.dispatch(); //craate command start load images
		}
	}

}