package tests.com.iomull.imageGallery.model
{
	import com.iomull.imageGallery.model.ConfigAppModel;
	import com.iomull.imageGallery.model.vo.ImagePathVO;
	import com.iomull.imageGallery.signals.SignalParseComplete;
	import flash.events.EventDispatcher;
	import org.flexunit.asserts.assertEquals;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class ConfigModelTest 
	{
		private var configAppModel:ConfigAppModel;
		
		[Before]
		public function runBeforeTest(): void
		{
			configAppModel = new ConfigAppModel();
			configAppModel.eventDispatcher = new EventDispatcher();
			configAppModel.signalParseComplete = new SignalParseComplete();
		}
		
		[Test]
		public function testParseXML():void
		{
			const testImageXML:XML = 
			<images>
				<image name="image1"  small="../assets/images/1_s.jpg" big="../assets/images/1.jpg"/>
			</images>;
			
			configAppModel.parseXML(testImageXML);
			
			const path: ImagePathVO = configAppModel.pathes[0];
			
			var name	:String = "image1";
			var small	:String = "../assets/images/1_s.jpg";
			var big		:String = "../assets/images/1.jpg";
			
			assertEquals(name, path.name);
			assertEquals(small, path.small);
			assertEquals(big, path.big);
		}
		
		[After]
		public function runAfterTest():void
		{
			configAppModel = null;
		}
	}

}
