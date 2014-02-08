package com.iomull.imageGallery.model 
{
	import com.iomull.imageGallery.model.vo.ImagePathVO;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ConfigAppModel extends Actor 
	{
		public var buildID		:String = "000001";
		
		public var pathes:Vector.<ImagePathVO>
		
		public function ConfigAppModel() 
		{
		
		}
		
		public function parseXML(xml:XML): void
		{
			pathes = new Vector.<ImagePathVO>();
			
			//parse xml
			//for{var ibla-bla
				
			/*var imagePathVO:ImagePathVO = new ImagePathVO(xml[i].@small, xml[i].@big);
			pathes.push(imagePathVO);*/
				
			//}
			
			//dispatchsignalParseComplete //craate commant start load images
				//ParseComplete  - це команда там inject.configModel(); загружаю всы маленьки крим першои и посылаю лоадер посилае в ImageVo
		}
	}

}