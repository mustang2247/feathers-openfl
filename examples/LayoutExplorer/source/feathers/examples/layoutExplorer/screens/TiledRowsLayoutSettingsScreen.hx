package feathers.examples.layoutExplorer.screens;
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.List;
import feathers.controls.NumericStepper;
import feathers.controls.PanelScreen;
import feathers.controls.PickerList;
import feathers.data.ListCollection;
import feathers.examples.layoutExplorer.data.TiledRowsLayoutSettings;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.layout.TiledRowsLayout;

import starling.display.DisplayObject;
import starling.events.Event;
//[Event(name="complete",type="starling.events.Event")]

@:keep class TiledRowsLayoutSettingsScreen extends PanelScreen
{
	public function new()
	{
		super();
	}

	public var settings:TiledRowsLayoutSettings;

	private var _list:List;

	private var _itemCountStepper:NumericStepper;
	private var _requestedColumnCountStepper:NumericStepper;
	private var _pagingPicker:PickerList;
	private var _horizontalGapStepper:NumericStepper;
	private var _verticalGapStepper:NumericStepper;
	private var _paddingTopStepper:NumericStepper;
	private var _paddingRightStepper:NumericStepper;
	private var _paddingBottomStepper:NumericStepper;
	private var _paddingLeftStepper:NumericStepper;
	private var _horizontalAlignPicker:PickerList;
	private var _verticalAlignPicker:PickerList;
	private var _tileHorizontalAlignPicker:PickerList;
	private var _tileVerticalAlignPicker:PickerList;

	override public function dispose():Void
	{
		//icon and accessory display objects in the list's data provider
		//won't be automatically disposed because feathers cannot know if
		//they need to be used again elsewhere or not. we need to dispose
		//them manually.
		this._list.dataProvider.dispose(disposeItemAccessory);

		//never forget to call super.dispose() because you don't want to
		//create a memory leak!
		super.dispose();
	}

	override private function initialize():Void
	{
		//never forget to call super.initialize()
		super.initialize();

		this.title = "Tiled Rows Layout Settings";

		this.layout = new AnchorLayout();

		this._itemCountStepper = new NumericStepper();
		this._itemCountStepper.minimum = 1;
		//the layout can certainly handle more. this value is arbitrary.
		this._itemCountStepper.maximum = 100;
		this._itemCountStepper.step = 1;
		this._itemCountStepper.value = this.settings.itemCount;
		this._itemCountStepper.addEventListener(Event.CHANGE, itemCountStepper_changeHandler);

		this._requestedColumnCountStepper = new NumericStepper();
		this._requestedColumnCountStepper.minimum = 0;
		//the layout can certainly handle more. this value is arbitrary.
		this._requestedColumnCountStepper.maximum = 10;
		this._requestedColumnCountStepper.step = 1;
		this._requestedColumnCountStepper.value = this.settings.requestedColumnCount;
		this._requestedColumnCountStepper.addEventListener(Event.CHANGE, requestedColumnCountStepper_changeHandler);

		this._pagingPicker = new PickerList();
		this._pagingPicker.typicalItem = TiledRowsLayout.PAGING_HORIZONTAL;
		this._pagingPicker.dataProvider = new ListCollection(
		[
			TiledRowsLayout.PAGING_NONE,
			TiledRowsLayout.PAGING_HORIZONTAL,
			TiledRowsLayout.PAGING_VERTICAL
		]);
		this._pagingPicker.selectedItem = this.settings.paging;
		this._pagingPicker.addEventListener(Event.CHANGE, pagingPicker_changeHandler);

		this._horizontalAlignPicker = new PickerList();
		this._horizontalAlignPicker.typicalItem = TiledRowsLayout.HORIZONTAL_ALIGN_CENTER;
		this._horizontalAlignPicker.dataProvider = new ListCollection(
		[
			TiledRowsLayout.HORIZONTAL_ALIGN_LEFT,
			TiledRowsLayout.HORIZONTAL_ALIGN_CENTER,
			TiledRowsLayout.HORIZONTAL_ALIGN_RIGHT
		]);
		this._horizontalAlignPicker.selectedItem = this.settings.horizontalAlign;
		this._horizontalAlignPicker.addEventListener(Event.CHANGE, horizontalAlignPicker_changeHandler);

		this._verticalAlignPicker = new PickerList();
		this._verticalAlignPicker.typicalItem = TiledRowsLayout.VERTICAL_ALIGN_BOTTOM;
		this._verticalAlignPicker.dataProvider = new ListCollection(
		[
			TiledRowsLayout.VERTICAL_ALIGN_TOP,
			TiledRowsLayout.VERTICAL_ALIGN_MIDDLE,
			TiledRowsLayout.VERTICAL_ALIGN_BOTTOM
		]);
		this._verticalAlignPicker.selectedItem = this.settings.verticalAlign;
		this._verticalAlignPicker.addEventListener(Event.CHANGE, verticalAlignPicker_changeHandler);

		this._tileHorizontalAlignPicker = new PickerList();
		this._tileHorizontalAlignPicker.typicalItem = TiledRowsLayout.TILE_HORIZONTAL_ALIGN_CENTER;
		this._tileHorizontalAlignPicker.dataProvider = new ListCollection(
		[
			TiledRowsLayout.TILE_HORIZONTAL_ALIGN_LEFT,
			TiledRowsLayout.TILE_HORIZONTAL_ALIGN_CENTER,
			TiledRowsLayout.TILE_HORIZONTAL_ALIGN_RIGHT,
			TiledRowsLayout.TILE_HORIZONTAL_ALIGN_JUSTIFY
		]);
		this._tileHorizontalAlignPicker.selectedItem = this.settings.tileHorizontalAlign;
		this._tileHorizontalAlignPicker.addEventListener(Event.CHANGE, tileHorizontalAlignPicker_changeHandler);

		this._tileVerticalAlignPicker = new PickerList();
		this._tileVerticalAlignPicker.typicalItem = TiledRowsLayout.TILE_VERTICAL_ALIGN_BOTTOM;
		this._tileVerticalAlignPicker.dataProvider = new ListCollection(
		[
			TiledRowsLayout.TILE_VERTICAL_ALIGN_TOP,
			TiledRowsLayout.TILE_VERTICAL_ALIGN_MIDDLE,
			TiledRowsLayout.TILE_VERTICAL_ALIGN_BOTTOM,
			TiledRowsLayout.TILE_VERTICAL_ALIGN_JUSTIFY
		]);
		this._tileVerticalAlignPicker.selectedItem = this.settings.tileVerticalAlign;
		this._tileVerticalAlignPicker.addEventListener(Event.CHANGE, tileVerticalAlignPicker_changeHandler);

		this._horizontalGapStepper = new NumericStepper();
		this._horizontalGapStepper.minimum = 0;
		//these maximum values are completely arbitrary
		this._horizontalGapStepper.maximum = 100;
		this._horizontalGapStepper.step = 1;
		this._horizontalGapStepper.value = this.settings.horizontalGap;
		this._horizontalGapStepper.addEventListener(Event.CHANGE, horizontalGapStepper_changeHandler);

		this._verticalGapStepper = new NumericStepper();
		this._verticalGapStepper.minimum = 0;
		this._verticalGapStepper.maximum = 100;
		this._verticalGapStepper.step = 1;
		this._verticalGapStepper.value = this.settings.verticalGap;
		this._verticalGapStepper.addEventListener(Event.CHANGE, verticalGapStepper_changeHandler);

		this._paddingTopStepper = new NumericStepper();
		this._paddingTopStepper.minimum = 0;
		this._paddingTopStepper.maximum = 100;
		this._paddingTopStepper.step = 1;
		this._paddingTopStepper.value = this.settings.paddingTop;
		this._paddingTopStepper.addEventListener(Event.CHANGE, paddingTopStepper_changeHandler);

		this._paddingRightStepper = new NumericStepper();
		this._paddingRightStepper.minimum = 0;
		this._paddingRightStepper.maximum = 100;
		this._paddingRightStepper.step = 1;
		this._paddingRightStepper.value = this.settings.paddingRight;
		this._paddingRightStepper.addEventListener(Event.CHANGE, paddingRightStepper_changeHandler);

		this._paddingBottomStepper = new NumericStepper();
		this._paddingBottomStepper.minimum = 0;
		this._paddingBottomStepper.maximum = 100;
		this._paddingBottomStepper.step = 1;
		this._paddingBottomStepper.value = this.settings.paddingBottom;
		this._paddingBottomStepper.addEventListener(Event.CHANGE, paddingBottomStepper_changeHandler);

		this._paddingLeftStepper = new NumericStepper();
		this._paddingLeftStepper.minimum = 0;
		this._paddingLeftStepper.maximum = 100;
		this._paddingLeftStepper.step = 1;
		this._paddingLeftStepper.value = this.settings.paddingLeft;
		this._paddingLeftStepper.addEventListener(Event.CHANGE, paddingLeftStepper_changeHandler);

		this._list = new List();
		this._list.isSelectable = false;
		this._list.dataProvider = new ListCollection(
		[
			{ label: "Item Count", accessory: this._itemCountStepper },
			{ label: "Requested Column Count", accessory: this._requestedColumnCountStepper },
			{ label: "Paging", accessory: this._pagingPicker },
			{ label: "horizontalAlign", accessory: this._horizontalAlignPicker },
			{ label: "verticalAlign", accessory: this._verticalAlignPicker },
			{ label: "tileHorizontalAlign", accessory: this._tileHorizontalAlignPicker },
			{ label: "tileVerticalAlign", accessory: this._tileVerticalAlignPicker },
			{ label: "horizontalGap", accessory: this._horizontalGapStepper },
			{ label: "verticalGap", accessory: this._verticalGapStepper },
			{ label: "paddingTop", accessory: this._paddingTopStepper },
			{ label: "paddingRight", accessory: this._paddingRightStepper },
			{ label: "paddingBottom", accessory: this._paddingBottomStepper },
			{ label: "paddingLeft", accessory: this._paddingLeftStepper },
		]);
		this._list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
		this.addChild(this._list);

		this.headerFactory = this.customHeaderFactory;

		this.backButtonHandler = this.onBackButton;
	}

	private function customHeaderFactory():Header
	{
		var header:Header = new Header();
		var doneButton:Button = new Button();
		doneButton.label = "Done";
		doneButton.addEventListener(Event.TRIGGERED, doneButton_triggeredHandler);
		header.rightItems = 
		[
			doneButton
		];
		return header;
	}

	private function disposeItemAccessory(item:Dynamic):Void
	{
		cast(item.accessory, DisplayObject).dispose();
	}

	private function onBackButton():Void
	{
		this.dispatchEventWith(Event.COMPLETE);
	}

	private function doneButton_triggeredHandler(event:Event):Void
	{
		this.onBackButton();
	}

	private function itemCountStepper_changeHandler(event:Event):Void
	{
		this.settings.itemCount = Std.int(this._itemCountStepper.value);
	}

	private function requestedColumnCountStepper_changeHandler(event:Event):Void
	{
		this.settings.requestedColumnCount = Std.int(this._requestedColumnCountStepper.value);
	}

	private function pagingPicker_changeHandler(event:Event):Void
	{
		this.settings.paging = cast(this._pagingPicker.selectedItem, String);
	}

	private function horizontalAlignPicker_changeHandler(event:Event):Void
	{
		this.settings.horizontalAlign = cast(this._horizontalAlignPicker.selectedItem, String);
	}

	private function verticalAlignPicker_changeHandler(event:Event):Void
	{
		this.settings.verticalAlign = cast(this._verticalAlignPicker.selectedItem, String);
	}

	private function tileHorizontalAlignPicker_changeHandler(event:Event):Void
	{
		this.settings.tileHorizontalAlign = cast(this._tileHorizontalAlignPicker.selectedItem, String);
	}

	private function tileVerticalAlignPicker_changeHandler(event:Event):Void
	{
		this.settings.tileVerticalAlign = cast(this._tileVerticalAlignPicker.selectedItem, String);
	}

	private function horizontalGapStepper_changeHandler(event:Event):Void
	{
		this.settings.horizontalGap = this._horizontalGapStepper.value;
	}

	private function verticalGapStepper_changeHandler(event:Event):Void
	{
		this.settings.verticalGap = this._verticalGapStepper.value;
	}

	private function paddingTopStepper_changeHandler(event:Event):Void
	{
		this.settings.paddingTop = this._paddingTopStepper.value;
	}

	private function paddingRightStepper_changeHandler(event:Event):Void
	{
		this.settings.paddingRight = this._paddingRightStepper.value;
	}

	private function paddingBottomStepper_changeHandler(event:Event):Void
	{
		this.settings.paddingBottom = this._paddingBottomStepper.value;
	}

	private function paddingLeftStepper_changeHandler(event:Event):Void
	{
		this.settings.paddingLeft = this._paddingLeftStepper.value;
	}
}
