package com.iomull.imageGallery.view 
{
	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.filters.GradientGlowFilter;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * Build Version View
	 * @author Oleksandr Grynivsky
	 */
	public class BuildVersionView extends TextField
	{
		
		private var _version:Number;
		private var _buildFormat:TextFormat;
		private var _gradientGlow:GradientGlowFilter;
		private var _isShowed:Boolean;
		
		public function BuildVersionView()
		{
			initView();
		}
		
		private function initView():void
		{
			_buildFormat = new TextFormat();
			_buildFormat.font = "Arial";
            _buildFormat.color = 0xffd21e;
            _buildFormat.size = 20;
			_buildFormat.align = "left";
			_buildFormat.bold = false;
			
			this.defaultTextFormat = _buildFormat;
			this.selectable = false;
			this.multiline = true;
			this.antiAliasType = AntiAliasType.ADVANCED;
			this.autoSize = TextFieldAutoSize.LEFT;
			
			_gradientGlow = new GradientGlowFilter();
			_gradientGlow.distance = 0; 
			_gradientGlow.angle = 45; 
			_gradientGlow.colors = [0xfff201, 0x000000];
			_gradientGlow.alphas = [0, 1]; 
			_gradientGlow.ratios = [0, 255]; 
			_gradientGlow.blurX = 2; 
			_gradientGlow.blurY = 2; 
			_gradientGlow.strength = 3;
			_gradientGlow.quality = BitmapFilterQuality.HIGH;
			_gradientGlow.type = BitmapFilterType.OUTER;
			this.filters = [_gradientGlow];
		}
		
		public function switchBuildNumberView(buildNo:String=null):void 
		{
			if (!_isShowed)
			{
				this.text = buildNo;
				this.visible = true;
			}
			else
			{
				this.text = "";
				this.visible = false;
			}
			
			_isShowed = !_isShowed;
		}
		
	}
}