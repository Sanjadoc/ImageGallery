package com.iomull.imageGallery.model
{
	import com.iomull.imageGallery.model.api.IStateModel;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Oleksandr Grynivskyi
	 */
	public class StateModel extends Actor implements IStateModel
	{
		private var _bigImages	:Vector.<int> = new Vector.<int>();
		private var _smalImages	:Vector.<int> = new Vector.<int>();
		private var _selectedName:String;
		
		
		public function get smallImages():Vector.<int>
		{
			return _smalImages;
		}
		
		public function set smallImages(value:Vector.<int>):void
		{
			_smalImages = value;
		}
		
		public function get bigImages():Vector.<int>
		{
			return _bigImages;
		}
		
		public function set bigImages(value:Vector.<int>):void
		{
			_bigImages = value;
		}
		
		public function get selectedName():String
		{
			return _selectedName;
		}
		
		public function set selectedName(value:String):void
		{
			_selectedName = value;
		}
		
	}

}