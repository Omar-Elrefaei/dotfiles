   �         .http://curriculum.qsi.org/DXR.axd?r=1_79-Lp3X3     %�-��)     %yk���         
     O K           �      Cache-Control   public, max-age=31536000   Content-Type   text/javascript   Content-Encoding   gzip   Expires   Tue, 18 Dec 2012 21:13:05 GMT   Last-Modified   Mon, 19 Dec 2011 21:13:05 GMT   Server   Microsoft-IIS/7.5   X-Powered-By   ASP.NET   Date   Sat, 21 Oct 2017 11:46:56 GMT ASPxClientUploadControlIDSuffix = {
 FlagHiddenInput: "_dxeUpload",
 ErrorRow: "_ErrR",
 ErrorRowTemplate: "_ErrRRT",
 UploadIFrame: "_UploadIframe",
 TextBoxCell: "_TextBox",
 FileInput: "_Input",
 FileFakeInput: "_FakeInput",
 AddUploadButtonsSeparator: "_AddUploadR",
 AddUploadButtonsPanelRow: "_AddUploadPanelR",
 InputCountHidden: "_IC",
 AddButtonCell: "_Add",
 UploadButtonCell: "_Upload",
 BrowseButtonCell: "_Browse",
 RemoveButtonCell: "_Remove",
 CancelButtonCell: "_Cancel",
 CommonErrorDiv: "_CErr",
 SLPluginLinkTable: "_SLPluginLinkPanel",
 ButtonImageIdPostfix: "Img",
 UploadInputsTable: "_UploadInputs",
 ProgressPanel: "_ProgressPanel",
 ProgressControl: "_UCProgress",
 SlUploadHelper: "_SLUploadHelper",
 SlUploadHost: "_SLUploadHost"
};
var __aspxErrorTextResponsePrefix = "DXER:";
var __aspxBrowseButtonCellClassName = "dxBB";
var __aspxRemoveButtonCellClassName = "dxRB";
var __aspxFITextBoxHoverDocumentClassName = "dxFITextBoxHover";
var __aspxFIButtonHoverDocumentClassName = "dxFIButtonHover";
var __aspxProgressInfoQueryParamName = "DXProgressInfo";
var __aspxUploadingCallbackQueryParamName = "DXUploadingCallback";
var __aspxHelperUploadingCallbackQueryParamName = "DXHelperUploadingCallback";
var __aspxProgressHandlerKeyQueryParamName = "DXProgressHandlerKey";
var __aspxDefaultPacketSizeValue = 200000;
var __aspxDefaultTemporaryFolderPath = "~\\App_Data\\UploadTemp\\";
var __aspxCancelUploadFakeQueryParamName = "DXFakeQueryParam";
ASPxClientUploadControl = _aspxCreateClass(ASPxClientControl, {
 constructor: function(name) {
  this.constructor.prototype.constructor.call(this, name);
  this.fileInputSpacing = "";
  this.generalErrorText = "";
  this.unspecifiedErrorText = "";
  this.uploadWasCanceledErrorText = "";
  this.invalidWindowsPathErrorText = "";
  this.validationSettings = {};
  this.isNative = false;
  this.isInCallback = false;
  this.isCancel = false;
  this.uploadingTimerID = null;
  this.isProgressWaiting = false;
  this.isResponseWaiting = false;
  this.progressHandlerPage = "";
  this.uploadProcessingEnabled = false;
  this.uploadHelpersEnabled = false;
  this.slUploadHelper = new ASPxClientSlUploadHelper(this);
  this.slUploadHelperUrl = "";
  this.packetSize = __aspxDefaultPacketSizeValue;
  this.tempFolderPath = __aspxDefaultTemporaryFolderPath;
  this.templateDisabledTextBoxItem = null;
  this.templateHoveredBrowseItem = null;
  this.templatePressedBrowseItem = null;
  this.templateDisabledBrowseItem = null;
  this.templateDisabledRemoveItem = null;
  this.sizingConfig.allowSetWidth = false;
  this.sizingConfig.allowSetHeight = false;
  this.FileUploadComplete = new ASPxClientEvent();
  this.FilesUploadComplete = new ASPxClientEvent();
  this.FileUploadStart = new ASPxClientEvent();
  this.UploadingProgressChanged = new ASPxClientEvent();
  this.TextChanged = new ASPxClientEvent();
  this.FileInputCountChanged = new ASPxClientEvent();
 },
 Initialize: function() {
  ASPxClientControl.prototype.Initialize.call(this);
  this.AdjustMainElementWidth();
  if (__aspxFirefox && this.isNative)
   this.CorrectFileInputSize();
  if (__aspxIE && document.documentMode == 7)
   _aspxGetChildByTagName(this.GetMainElement(), "TABLE", 0).style.borderCollapse = "separate";
  if (__aspxOpera && !frames[this.GetFakeIframeName()])
   this.ReinitializeIFrame(this.GetFakeIframe());
  this.GetIFrameUrl();
  this.InitializeForm();
  this.InitializeHelpersElement();
  this.InitializeTemplates();
  if(!this.isNative)
   this.InitializeFileInputStyles();
  _aspxAttachEventToElement(__aspxIE ? this.GetFakeIframeElement() : this.GetFakeIframe(), "load",
   new Function("aspxFakeUploadIframeOnLoad('" + this.name + "');"));
  for(var i = 0; i < this.GetFileInputCountInternal(); i++)
   this.ChangeEventsToFileInput(true, i);
 },
 InitializeHelpersElement: function() {
  if(this.IsSlUploadHelperEnabled()) {
   if(!__aspxIE) {
    var slHost = document.createElement("DIV");
    _aspxSetAttribute(slHost, "id", this.GetSlUploadHostElementID());
    _aspxSetAttribute(slHost.style, "position", "absolute");
    _aspxSetAttribute(slHost.style, "width", "0px");
    _aspxSetAttribute(slHost.style, "heigth", "0px");
    _aspxSetAttribute(slHost.style, "border-width", "0px");
    var mainCell = this.GetUploadInputsTable().parentNode;
    mainCell.appendChild(slHost);
   }
   var indexs = ["T"];
   for(var i = 0; i < this.GetFileInputCountInternal(); i++)
    indexs.push(i);
   for(var i = 0; i < indexs.length; i++) {
    var index = indexs[i];
    var slHelper = this.slUploadHelper.CreateSlObject(this.slUploadHelperUrl, index);
    if(this.GetSlUploadHostElement()) {
     if(index != "T")
      this.GetSlUploadHostElement().appendChild(slHelper);
    }
    else
     this.GetTextBoxCell(index).insertBefore(slHelper, this.GetFileInputElement(index));
    this.GetTextBoxCell(index).removeChild(this.GetFileInputElement(index));
   }
  }
  else if(this.IsShowSlPluginLinkElement())
   this.SetVisibleSlPluginLinkTable(true);
 },
 InitializeTemplates: function() {
  this.clearFileInputTempalteHtml = _aspxGetChildByTagName(this.GetFileInputRowTemplate(), "TD", 0).innerHTML;
  this.fileInputRowTemplateNode = this.GetFileInputRowTemplate().cloneNode(true);
  _aspxSetElementDisplay(this.fileInputRowTemplateNode, true);
  var errorRowTemplate = this.GetErrorRowTemplate();
  if(errorRowTemplate)
   this.errorRowTemplateNode = this.GetErrorRowTemplate().cloneNode(true);
  if(this.fileInputSpacing != "") {
   this.fileInputSeparatorTemplateNode = this.GetFileInputSeparatorRowTemplate().cloneNode(true);
   _aspxSetElementDisplay(this.fileInputSeparatorTemplateNode, true);
  }
 },
 InitializeForm: function() {
  var form = this.GetParentForm();
  if (form) form.enctype = form.encoding = "multipart/form-data";
 },
 InitializeFileInputStyles: function() {
  var fileInputHoverDocumentStyleSheet = this.CreateStyleSheet();
  _aspxAddStyleSheetRule(fileInputHoverDocumentStyleSheet,
          " ." + __aspxFITextBoxHoverDocumentClassName,
          "cursor: " + _aspxGetCurrentStyle(this.GetTextBoxCell("T"))["cursor"] + ";");
  _aspxAddStyleSheetRule(fileInputHoverDocumentStyleSheet,
          " ." + __aspxFIButtonHoverDocumentClassName,
          "cursor: " + _aspxGetCurrentStyle(this.GetBrowseButtonCell("T"))["cursor"] + ";");
 },
 CreateStyleSheet: function() {
  var styleElement = document.getElementById(this.name + "_SS");
  if(styleElement == null) {
   var styleSheet = _aspxCreateStyleSheet();
   if(__aspxIE)
    styleSheet.owningElement.id = this.name + "_SS"
   else
    styleSheet.ownerNode.id = this.name + "_SS";
   return styleSheet;
  }
  else
   return __aspxIE ? styleElement.styleSheet : styleElement.sheet;
 },
 ReinitializeIFrame: function(iframe) {
  var divElem = document.createElement("DIV");
  _aspxSetElementDisplay(divElem, false);
  var parentIframe = iframe.parentNode;
  parentIframe.appendChild(divElem);
  divElem.appendChild(iframe);
 },
 AttachEventForElement: function(element, eventName, func) {
  element["dx" + eventName] = func;
  _aspxAttachEventToElement(element, eventName, element["dx" + eventName]);
 },
 DetachEventForElement: function(element, eventName) {
  if(element["dx" + eventName]) {
   _aspxDetachEventFromElement(element, eventName, element["dx" + eventName]);
   element["dx" + eventName] = null;
  }
 },
 ChangeEventsMethod: function(attach) {
  return attach ? this.AttachEventForElement : this.DetachEventForElement;
 },
 ChangeEventsToFileInput: function(attach, index) {
  var method = this.ChangeEventsMethod(attach);
  var fileInput = this.GetFileSelectorElement(index);
  if(!this.isNative) {
   var textBoxCell = !(__aspxIE || __aspxOpera) ? this.GetTextBoxCell(index) : this.GetFileFakeInputElement(index);
   method(textBoxCell, "mousemove", new Function("event", "aspxUTextBoxMouseMove(event, '" + this.name + "'," + index + ");"));
   method(textBoxCell, "mouseout", new Function("event", "aspxUTextBoxMouseOut(event, '" + this.name + "'," + index + ");"));
   var browseButton = this.GetBrowseButtonCell(index);
   method(browseButton, "mousemove", new Function("event", "aspxUBrowseButtonMouseMove(event, '" + this.name + "'," + index + ");"));
   method(browseButton, "mouseout", new Function("event", "aspxUBrowseButtonMouseOut(event, '" + this.name + "'," + index + ");"));
   method(fileInput, "mousemove", new Function("event", "aspxUFileInputMouseMove(event, '" + this.name + "'," + index + ");"));
   method(fileInput, "mouseout", new Function("event", "aspxUFileInputMouseOut(event, '" + this.name + "'," + index + ");"));
   method(fileInput, "mousedown", new Function("event", "aspxUFileInputMouseDown(event, '" + this.name + "'," + index + ");"));
   method(fileInput, "mouseup", new Function("event", "aspxUFileInputMouseUp(event, '" + this.name + "'," + index + ");"));
  }
  if(!this.IsSlUploadHelperEnabled())
   method(fileInput, "change", new Function("event", "aspxUTextChanged('" + this.name + "'," + index + ");"));
 },
 AdjustControlCore: function() {
  ASPxClientControl.prototype.AdjustControlCore.call(this);
  this.AdjustMainElementWidth();
  if (__aspxFirefox && this.isNative) {
   this.CorrectFileInputSize();
   this.InitializeTemplates();
  }
 },
 AdjustMainElementWidth: function() {
  var element = this.GetMainElement();
  if(this.IsDisplayed() && element.style.width == "") {
   if(__aspxIE)
    element.style.width = _aspxGetClearClientWidth(element);
   else
    element.style.width = _aspxGetCurrentStyle(element).width;
  }
 },
 CorrectFileInputSize: function() {
  if(!this.IsDisplayed())
   return;
  var width = this.GetInputWidth();
  var fontSize = this.GetInputFontSize();
  var size = this.FindInputSize(width, fontSize);
  this.GetFileInputElement("T").size = size;
  var fileInputCount = this.GetFileInputCountInternal();
  for (var i = 0; i < fileInputCount; i++)
   this.GetFileInputElement(i).size = size;
 },
 GetInputWidth: function() {
  var width = 0;
  if (this.GetFileInputCountInternal() > 0)
   width = this.GetFileInputElement(0).clientWidth;
  else {
   _aspxSetElementDisplay(this.GetFileInputRowTemplate(), true);
   width = this.GetFileInputElement("T").clientWidth;
   _aspxSetElementDisplay(this.GetFileInputRowTemplate(), false);
  }
  return width;
 },
 GetInputFontSize: function() {
  if (this.GetFileInputCountInternal() > 0)
   return _aspxGetCurrentStyle(this.GetFileInputElement(0)).fontSize;
  else
   return _aspxGetCurrentStyle(this.GetFileInputElement("T")).fontSize;
 },
 FindInputSize: function(width, fontSize) {
  var spanInput = document.createElement("SPAN");
  document.body.appendChild(spanInput);
  var fakeInput = document.createElement("INPUT");
  fakeInput.type = "file";
  fakeInput.size = 1;
  fakeInput.style.fontSize = fontSize;
  spanInput.appendChild(fakeInput);
  var stepSize = 1;
  while (true) {
   var previousInputWidth = spanInput.offsetWidth;
   fakeInput.size += stepSize;
   if(previousInputWidth == spanInput.offsetWidth) {
    fakeInput.size = 1;
    break;
   }
   if (spanInput.offsetWidth == width)
    break;
   else if (spanInput.offsetWidth > width) {
    if (stepSize > 1) {
     fakeInput.size -= stepSize;
     stepSize = 1;
    } else {
     fakeInput.size -= 1;
     break;
    }
   }
   else
    stepSize *= 2;
  }
  var inputSize = fakeInput.size;
  _aspxRemoveElement(fakeInput);
  _aspxRemoveElement(spanInput);
  return inputSize;
 },
 GetSelectedInputFileCount: function() {
  if (!_aspxIsExists(this.selectedInputFileCount)) {
   this.selectedInputFileCount = 0;
   var fileInputCount = this.GetFileInputCountInternal();
   for (var i = 0; i < fileInputCount; i++)
    if (this.GetValue(i) != "")
     this.selectedInputFileCount++;
  }
  return this.selectedInputFileCount;
 },
 GetFileInputCountInternal: function() {
  var element = this.GetInputCountHiddenField();
  return parseInt(element.value, 10);
 },
 SetFileInputCountInternal: function(value) {
  this.GetInputCountHiddenField().value = value;
 },
 GetInputCountHiddenField: function() {
  if (!this.inputCountHiddenField) {
   var id = this.name + ASPxClientUploadControlIDSuffix.InputCountHidden;
   this.inputCountHiddenField = _aspxGetElementById(id);
  }
  return this.inputCountHiddenField;
 },
 GetIFrameUrl: function() {
  if (!this.iframeUrl) {
   var iframe = __aspxIE ? this.GetFakeIframeElement() : this.GetFakeIframe();
   this.iframeUrl = iframe.attributes["src"].value;
  }
  return this.iframeUrl;
 },
 SetIFrameUrl: function(url) {
  var iframe = __aspxIE ? this.GetFakeIframeElement() : this.GetFakeIframe();
  iframe.attributes["src"].value = url;
 },
 GetProgressInfoKey: function() {
  return this.uploadingKey;
 },
 GetErrorRow: function(index) {
  return this.GetChild(ASPxClientUploadControlIDSuffix.ErrorRow + index);
 },
 GetErrorCell: function(index) {
  return _aspxGetElementsByTagName(this.GetErrorRow(index), "td")[0];
 },
 GetErrorRowTemplate: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.ErrorRowTemplate);
 },
 GetFakeIframe: function() {
  var name = this.GetFakeIframeName();
  return __aspxIE ? frames[name] : _aspxGetElementById(name);
 },
 GetFakeIframeName: function() {
  return this.name + ASPxClientUploadControlIDSuffix.UploadIFrame;
 },
 GetFakeIframeElement: function() {
  return this.GetFakeIframe().frameElement;
 },
 GetFakeIframeDocument: function() {
  return __aspxIE ? this.GetFakeIframe().document : this.GetFakeIframe().contentDocument;
 },
 GetFakeIframeResponseString: function() {
  return _aspxDecodeHtml(this.GetFakeIframeDocument().body.innerHTML);
 },
 GetFileInputRow: function(index) {
  return _aspxGetParentByTagName(this.GetTextBoxCell(index), "TR");
 },
 GetTextBoxCellID: function(index) {
  return this.name + ASPxClientUploadControlIDSuffix.TextBoxCell + index;
 },
 GetTextBoxCell: function(index) {
  return _aspxGetInputElementById(this.GetTextBoxCellID(index));
 },
 GetFileInputElement: function(index) {
  return _aspxGetInputElementById(this.GetTextBoxCellID(index) + ASPxClientUploadControlIDSuffix.FileInput);
 },
 GetFileFakeInputElement: function(index) {
  return _aspxGetInputElementById(this.GetTextBoxCellID(index) + ASPxClientUploadControlIDSuffix.FileFakeInput);
 },
 GetFileInputRowTemplate: function() {
  if(!this.fileInputRowTemplate) {
   var inputTemplate = this.GetFileInputRow("T");
   this.fileInputRowTemplate = _aspxGetParentByTagName(inputTemplate, "TR");
  }
  return this.fileInputRowTemplate;
 },
 GetFileInputsTBody: function() {
  if (!this.tbody)
   this.tbody = _aspxGetParentByTagName(this.GetFileInputRowTemplate(), "TBODY");
  return this.tbody;
 },
 GetUploadInputsTable: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.UploadInputsTable);
 },
 GetProgressPanel: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.ProgressPanel);
 },
 GetProgressControl: function() {
  if (!this.progressControl) {
   var name = this.name + ASPxClientUploadControlIDSuffix.ProgressControl;
   this.progressControl = aspxGetControlCollection().Get(name);
  }
  return this.progressControl;
 },
 GetBrowseButtonCell: function(index) {
  return _aspxGetChildrenByPartialClassName(this.GetFileInputRow(index), __aspxBrowseButtonCellClassName)[0];
 },
 GetRemoveButtonCell: function(index) {
  return _aspxGetChildrenByPartialClassName(this.GetFileInputRow(index), __aspxRemoveButtonCellClassName)[0];
 },
 GetAddButtonCell: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.AddButtonCell);
 },
 GetUploadButtonCell: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.UploadButtonCell);
 },
 GetCancelButtonCell: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.CancelButtonCell);
 },
 GetAddButtonLink: function() {
  return _aspxGetChildByTagName(this.GetAddButtonCell(), "A", 0);
 },
 GetUploadButtonLink: function() {
  return _aspxGetChildByTagName(this.GetUploadButtonCell(), "A", 0);
 },
 GetAddUploadButtonsSeparatorRow: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.AddUploadButtonsSeparator);
 },
 GetAddUploadButtonsPanelRow: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.AddUploadButtonsPanelRow);
 },
 GetFileInputSeparatorRow: function(index) {
  if (this.fileInputSpacing == "" || this.GetFileInputCountInternal() == 1)
   return null;
  if (!_aspxIsExists(index))
   index = 0;
  var ret = null;
  var errorRow = this.GetErrorRow(index);
  var fileInput = this.GetFileInputRow(index);
  var target = errorRow ? errorRow : fileInput;
  if (target) {
   var parent = target.parentNode;
   var rowIndex = _aspxArrayIndexOf(parent.childNodes, target);
   var element = parent.childNodes[rowIndex + 1];
   if (!element.id)
    ret = parent.childNodes[rowIndex + 1];
  }
  return ret;
 },
 GetFileInputSeparatorRowTemplate: function() {
  if (this.fileInputSpacing == "")
   return null;
  var parent = this.GetFileInputRowTemplate().parentNode;
  var fileInputRowIndex = _aspxArrayIndexOf(parent.childNodes, this.GetFileInputRowTemplate());
  fileInputRowIndex += this.errorRowTemplateNode ? 2 : 1;
  return parent.childNodes[fileInputRowIndex];
 },
 GetCommonErrorDivElement: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.CommonErrorDiv);
 },
 GetSlPluginLinkTableElement: function() {
  return this.GetChild(ASPxClientUploadControlIDSuffix.SLPluginLinkTable);
 },
 SetEnabledInternal: function(enabled) {
  for (var i = 0; i < this.GetFileInputCountInternal(); i++) {
   this.SetTextBoxEnabled(this.GetTextBoxCell(i), enabled);
   this.SetButtonEnabled(this.GetBrowseButtonCell(i), enabled);
   this.SetButtonEnabled(this.GetRemoveButtonCell(i), enabled);
  }
  this.SetButtonEnabled(this.GetAddButtonCell(), enabled);
  this.SetButtonEnabled(this.GetUploadButtonCell(), enabled);
 },
 SetTextBoxEnabled: function(element, enabled) {
  this.ChangeTextBoxEnabledState(element, enabled);
  this.ChangeTextBoxEnabledAttributes(element, _aspxChangeAttributesMethod(enabled), enabled);
 },
 SetButtonEnabled: function(element, enabled) {
  this.ChangeButtonEnabledState(element, enabled);
  this.ChangeButtonEnabledAttributes(element, _aspxChangeAttributesMethod(enabled), enabled);
 },
 GetSlUploadHelperElementID: function(index) {
  return this.GetTextBoxCellID(index) + ASPxClientUploadControlIDSuffix.SlUploadHelper;
 },
 GetSlUploadHostElementID: function() {
  return this.name + ASPxClientUploadControlIDSuffix.SlUploadHost;
 },
 GetSlUploadHelperElement: function(index) {
  return _aspxGetElementById(this.GetSlUploadHelperElementID(index));
 },
 GetSlUploadHostElement: function() {
  if(!this.slUploadHostElement)
   this.slUploadHostElement = _aspxGetElementById(this.GetSlUploadHostElementID());
  return this.slUploadHostElement;
 },
 GetFileSelectorElement: function(index) {
  if(this.IsSlUploadHelperEnabled())
   return this.GetSlUploadHelperElement(index);
  return this.GetFileInputElement(index);
 },
 GetIsResponseValid: function() {
  var ret = false;
  try {
   if (eval(this.GetFakeIframeResponseString()) != null)
    ret = true;
  }
  catch (e) {
   if (__aspxIE)
    this.GetFakeIframe().window.location = this.GetIFrameUrl(); 
  }
  return ret;
 },
 GetValue: function(index) {
  if(this.IsSlUploadHelperEnabled()) {
   var fileInfos = this.slUploadHelper.GetFileInfos(index);
   if(fileInfos) {
    var value = "";
    for(var i = 0; i < fileInfos.length; i++) {
     value += fileInfos[i].fullName;
     if((i + 1) < fileInfos.length)
      value += ", ";
    }
    return value;
   }
  }
  else {
   var fileInputElement = this.GetFileInputElement(index);
   if (fileInputElement)
    return fileInputElement.value;
  }
  return null;
 },
 ChangeTextBoxEnabledState: function(element, enabled) {
  if (element) {
   aspxGetStateController().SetElementEnabled(element, enabled);
   var editArea = _aspxGetChildByTagName(element, "INPUT", 1);
   if (editArea)
    aspxGetStateController().SetElementEnabled(editArea, enabled);
  }
 },
 ChangeTextBoxEnabledAttributes: function(element, method, enabled) {
  if (element) {
   var inputs = _aspxGetElementsByTagName(element, "INPUT");
   for(var i = 0; i < inputs.length; i++)
    inputs[i].disabled = !enabled;
  }
 },
 ChangeButtonEnabledState: function(element, enabled) {
  if (element)
   aspxGetStateController().SetElementEnabled(element, enabled);
 },
 ChangeButtonEnabledAttributes: function(element, method, enabled) {
  if (element) {
   method(element, "onclick");
   if (!__aspxIE && enabled)
    element.onclick = new Function(_aspxGetAttribute(element, "onclick"));
  }
 },
 ChangeButtonHoveredState: function(element, enabled) {
  if (element){
   element = enabled  ? aspxGetStateController().GetHoverElement(element) : null;
   aspxGetStateController().SetCurrentHoverElement(element);
  }
 },
 ChangeButtonPressedState: function(element, enabled) {
  if (element) {
   var controller = aspxGetStateController();
   var pressedElement = controller.GetPressedElement(element);
   controller.SetCurrentPressedElement(enabled ? pressedElement : null);
   controller.savedCurrentPressedElement = controller.currentPressedElement;
  }
 },
 AddFileInput: function(isUi) {
  var tBody = this.GetFileInputsTBody();
  var addUploadButtonsElement = this.GetAddUploadButtonsSeparatorRow();
  if (addUploadButtonsElement == null)
   addUploadButtonsElement = this.GetAddUploadButtonsPanelRow();
  if (this.fileInputSpacing != "" && this.GetFileInputCountInternal() != 0) {
   var separatorRow = this.fileInputSeparatorTemplateNode.cloneNode(true);
   tBody.insertBefore(separatorRow, addUploadButtonsElement);
  }
  tBody.insertBefore(this.CreateFileInputRow(this.GetFileInputCountInternal()), addUploadButtonsElement);
  var errorRow = this.CreateErrorRow(this.GetFileInputCountInternal());
  if(errorRow)
   tBody.insertBefore(errorRow, addUploadButtonsElement);
  this.ChangeEventsToFileInput(true, this.GetFileInputCountInternal());
  this.SetFileInputCountInternal(this.GetFileInputCountInternal() + 1);
  var element = this.GetAddUploadButtonsSeparatorRow();
  if (element && this.GetFileInputCountInternal() > 0 && !_aspxGetElementDisplay(element))
   _aspxSetElementDisplay(element, true);
  if(isUi)
   this.RaiseFileInputCountChanged();
 },
 RemoveFileInput: function(index, isUi) {
  var count = this.GetFileInputCountInternal();
  if(!_aspxIsExists(index)) 
   index = count - 1;
  if(count == 0 || index >= count) return;
  _aspxRemoveElement(this.GetFileInputSeparatorRow((index == 0) ? index : index - 1));
  _aspxRemoveElement(this.GetFileInputRow(index));
  _aspxRemoveElement(this.GetErrorRow(index));
  if(this.IsSlUploadHelperEnabled())
   this.slUploadHelper.RemoveSlObjectInHostElement(index);
  this.RedefineAttributtes(index + 1);
  this.SetFileInputCountInternal(this.GetFileInputCountInternal() - 1);
  var element = this.GetAddUploadButtonsSeparatorRow();
  if (element && this.GetFileInputCountInternal() == 0 && _aspxGetElementDisplay(element))
   _aspxSetElementDisplay(element, false);
  if(isUi)
   this.RaiseFileInputCountChanged();
 },
 SetVisibleSlPluginLinkTable: function(display) {
  if(this.IsShowSlPluginLinkElement()) {
   _aspxSetElementDisplay(this.GetUploadInputsTable(), !display);
   _aspxSetElementDisplay(this.GetSlPluginLinkTableElement(), display);
  }
 },
 RedefineAttributtes: function(startIndex) {
  var tBody = this.GetFileInputsTBody();
  for (var index = startIndex; index < this.GetFileInputCountInternal(); index++) {
   this.ChangeEventsToFileInput(false, index);
   var newIndex = index - 1;
   var textBoxCell = this.GetTextBoxCell(index);
   var browseButton = this.GetBrowseButtonCell(index);
   var removeButton = this.GetRemoveButtonCell(index);
   var errorRow = this.GetErrorRow(index);
   this.RedefineInputAttributes(textBoxCell, newIndex);
   this.RedefineBrowseAttributes(browseButton, newIndex);
   this.RedefineRemoveAttributes(removeButton, newIndex);
   if(errorRow)
    errorRow.id = this.name + ASPxClientUploadControlIDSuffix.ErrorRow + newIndex;
   this.ChangeEventsToFileInput(true, newIndex);
  }
 },
 RedefineInputAttributes: function(textBoxCell, index, isNewElement) {
  textBoxCell.id = this.GetTextBoxCellID(index);
  if(this.IsSlUploadHelperEnabled()) {
   if(this.GetSlUploadHostElement())
    this.slUploadHelper.RedefineSlObjectAttributesInHostElement(index + 1, index, isNewElement);
   else
    this.slUploadHelper.RedefineSlObjectAttributes(textBoxCell, index, isNewElement);
  }
  else {
   var inputElement = _aspxGetChildByTagName(textBoxCell, "INPUT", 0);
   inputElement.id = textBoxCell.id + ASPxClientUploadControlIDSuffix.FileInput;
   inputElement.name = inputElement.id;
  }
  var fakeInputElement = _aspxGetChildByTagName(textBoxCell, "INPUT", this.IsSlUploadHelperEnabled() ? 0 : 1);
  if(fakeInputElement)
   fakeInputElement.id = textBoxCell.id + ASPxClientUploadControlIDSuffix.FileFakeInput;
 },
 RedefineBrowseAttributes: function(browseButton, newIndex) {
  if (browseButton) {
   var newId = this.name + ASPxClientUploadControlIDSuffix.BrowseButtonCell + newIndex;
   browseButton.id = newId;
   var img = _aspxGetChildByTagName(browseButton, "IMG", 0);
   if (img)
    img.id = newId + ASPxClientUploadControlIDSuffix.ButtonImageIdPostfix;
  }
 },
 RedefineRemoveAttributes: function(removeButton, newIndex) {
  if (removeButton) {
   var newId = this.name + ASPxClientUploadControlIDSuffix.RemoveButtonCell + newIndex;
   removeButton.id = newId;
   var onclick = "aspxURemoveFileInputClick('" + this.name + "'," + newIndex + ");";
   removeButton.onclick = new Function(onclick);
   if(!(__aspxIE && __aspxBrowserVersion < 8))
    _aspxSetAttribute(removeButton, "onclick", onclick);
   var img = _aspxGetChildByTagName(removeButton, "IMG", 0);
   if (img)
    img.id = newId + ASPxClientUploadControlIDSuffix.ButtonImageIdPostfix;
  }
 },
 SetAddButtonTextInternal: function(text) {
  var link = this.GetAddButtonLink();
  if (link)
   link.innerHTML = text;
 },
 SetUploadButtonTextInternal: function(text) {
  var link = this.GetUploadButtonLink();
  if (link)
   link.innerHTML = text;
 },
 GetAddButtonTextInternal: function() {
  var link = this.GetAddButtonLink();
  if (link)
   return link.innerHTML;
  return null;
 },
 GetUploadButtonTextInternal: function() {
  var link = this.GetUploadButtonLink();
  if (link)
   return link.innerHTML;
  return null;
 },
 CreateFileInputRow: function(index) {
  var row = this.fileInputRowTemplateNode.cloneNode(true);
  var inputCell = _aspxGetChildByTagName(row, "TD", 0);
  this.RedefineInputAttributes(inputCell, index, true);
  this.CreateTextBoxDisabledState(index);
  var browseButton = _aspxGetChildrenByPartialClassName(row, __aspxBrowseButtonCellClassName)[0];
  this.RedefineBrowseAttributes(browseButton, index);
  if(browseButton) {
   this.CreateBrowseHoveredState(index);
   this.CreateBrowsePressedState(index);
   this.CreateBrowseDisabledState(index);
  }
  var removeButton = _aspxGetChildrenByPartialClassName(row, __aspxRemoveButtonCellClassName)[0];
  this.RedefineRemoveAttributes(removeButton, index);
  if(removeButton)
   this.CreateRemoveDisabledState(index);
  return row;
 },
 CreateTextBoxDisabledState: function(index) {
  if (this.templateDisabledTextBoxItem) {
   aspxGetStateController().AddDisabledItem(this.name + ASPxClientUploadControlIDSuffix.TextBoxCell + index,
    this.templateDisabledTextBoxItem.className, this.templateDisabledTextBoxItem.cssText,
    this.templateDisabledTextBoxItem.postfixes, this.templateDisabledTextBoxItem.imageUrls,
    this.templateDisabledTextBoxItem.imagePostfixes);
  }
 },
 CreateBrowseHoveredState: function(index) {
  if (this.templateHoveredBrowseItem) {
   aspxGetStateController().AddHoverItem(this.name + ASPxClientUploadControlIDSuffix.BrowseButtonCell + index,
    this.templateHoveredBrowseItem.className, this.templateHoveredBrowseItem.cssText,
    this.templateHoveredBrowseItem.postfixes, this.templateHoveredBrowseItem.imageObjs,
    this.templateHoveredBrowseItem.imagePostfixes);
  }
 },
 CreateBrowsePressedState: function(index) {
  if (this.templatePressedBrowseItem) {
   aspxGetStateController().AddPressedItem(this.name + ASPxClientUploadControlIDSuffix.BrowseButtonCell + index,
    this.templatePressedBrowseItem.className, this.templatePressedBrowseItem.cssText,
    this.templatePressedBrowseItem.postfixes, this.templatePressedBrowseItem.imageObjs,
    this.templatePressedBrowseItem.imagePostfixes);
  }
 },
 CreateBrowseDisabledState: function(index) {
  if (this.templateDisabledBrowseItem) {
   aspxGetStateController().AddDisabledItem(this.name + ASPxClientUploadControlIDSuffix.BrowseButtonCell + index,
    this.templateDisabledBrowseItem.className, this.templateDisabledBrowseItem.cssText,
    this.templateDisabledBrowseItem.postfixes, this.templateDisabledBrowseItem.imageObjs,
    this.templateDisabledBrowseItem.imagePostfixes);
  }
 },
 CreateRemoveDisabledState: function(index) {
  if (this.templateDisabledRemoveItem) {
   aspxGetStateController().AddDisabledItem(this.name + ASPxClientUploadControlIDSuffix.RemoveButtonCell + index,
    this.templateDisabledRemoveItem.className, this.templateDisabledRemoveItem.cssText,
    this.templateDisabledRemoveItem.postfixes, this.templateDisabledRemoveItem.imageObjs,
    this.templateDisabledRemoveItem.imagePostfixes);
  }
 },
 CreateErrorRow: function(index) {
  var row = null;
  if(this.errorRowTemplateNode) {
   row = this.errorRowTemplateNode.cloneNode(true);
   row.id = this.name + ASPxClientUploadControlIDSuffix.ErrorRow + index;
  }
  return row;
 },
 GetUploadFormAction: function(form){
  var action = form.action;
  var prefix = action.indexOf("?") >= 0 ? "&" : "?";
  if(this.IsSlUploadHelperEnabled())
   action += prefix + __aspxProgressHandlerKeyQueryParamName + "=" + this.GetProgressInfoKey();
  else if (this.IsUploadProcessingEnabled())
   action += prefix + __aspxProgressInfoQueryParamName + "=" + this.GetProgressInfoKey();
  prefix = action.indexOf("?") >= 0 ? "&" : "?";
  if(this.IsSlUploadHelperEnabled())
   action += prefix + __aspxHelperUploadingCallbackQueryParamName + "=" + this.name;
  else
   action += prefix + __aspxUploadingCallbackQueryParamName + "=" + this.name; 
  return action;
 },
 GetUploadFormTarget: function(form){
  return this.GetFakeIframe().name;
 },
 UploadForm: function() {
  var form = this.GetParentForm();
  if(!form) return;
  var sourceTarget = form.target;
  var soureActionString = form.action;
  form.action = this.GetUploadFormAction(form);
  form.target = this.GetUploadFormTarget(form);
  var isInternalErrorOccurred = false;
  try {
   form.submit();
  }
  catch (e) {
   isInternalErrorOccurred = true;
   this.WriteResponseString(__aspxErrorTextResponsePrefix + this.generalErrorText);
   this.OnCompleteFileUpload();
  }
  form.target = sourceTarget;
  form.action = soureActionString;
  return !isInternalErrorOccurred;
 },
 UploadFileFromUser: function() {
  this.isCancel = false;
  this.ClearErrorMessageCell();
  this.UpdateCommonErrorDiv("", false);
  var validateObj = {
    commonErrorText: "",
    commonCallbackData: ""
   };
  if (!this.isInCallback && !this.AreEmptyInputs()) {
   if ((__aspxIE && __aspxBrowserVersion != 7 && !this.ValidateWindowsFileNames())
    || !this.ValidateInputFiles(validateObj) || this.IsFileUploadCanceled(validateObj)) {
     this.RaiseFilesUploadComplete(validateObj);
     return false;
   }
   var isSuccessful = true;
   if(this.IsSlUploadHelperEnabled())
    this.BeginProcessUploading();
   else {
    isSuccessful = this.UploadForm();
    if (this.IsUploadProcessingEnabled())
     this.BeginProcessUploading();
   }
   if (isSuccessful)
    this.SetEnabledInternal(false);
   return true;
  }
 },
 CancelUploading: function() {
  if (this.isInCallback) {
   this.isCancel = true;
   var iframeUrl = ASPx.SSLSecureBlankUrl;
   if (__aspxOpera)
    this.SetIFrameUrl(iframeUrl + "&" + __aspxCancelUploadFakeQueryParamName + "=" + (new Date()).valueOf());
   this.SetIFrameUrl(iframeUrl);
   this.EndProcessUploading();
  }
 },
 CancelUploadingFileFromHelper: function() {
  this.CancelUploading();
 },
 CancelUploadingFileFromUser: function() {
  this.CancelUploading();
  if(this.IsSlUploadHelperEnabled())
   _aspxSetTimeout('aspxUploadAsyncCancelProcessing(\'' + this.name + '\')', 100);
 },
 IsRightToLeft: function () {
  return _aspxIsElementRightToLeft(this.GetMainElement());
 },
 IsShowProgressPanel: function() {
  return !!this.GetProgressPanel();
 },
 IsUploadProcessingEnabled: function() {
  return this.uploadProcessingEnabled;
 },
 IsPluginReady: function(index) {
  return this.slUploadHelper.IsObjectLoaded(index);
 },
 IsSlUploadHelperEnabled: function() {
  return this.uploadHelpersEnabled && !this.isNative && ASPxClientSlUploadHelper.IsPluginInstalled();
 },
 IsShowSlPluginLinkElement: function() {
  return this.uploadHelpersEnabled && !ASPxClientSlUploadHelper.IsPluginInstalled();
 },
 CreateXmlHttpRequestObject: function() {
  if(!this.xmlHttpRequest) {
   if (typeof (XMLHttpRequest) != 'undefined')
    this.xmlHttpRequest = new XMLHttpRequest();
   else if (typeof (ActiveXObject) != 'undefined')
    this.xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
   this.xmlHttpRequest.onreadystatechange = new Function("aspxUploadAsyncXmlHttpResponse('" + this.name + "');");
  }
  return this.xmlHttpRequest;
 },
 BeginProcessUploading: function() {
  if (this.IsShowProgressPanel())
   window.setTimeout('aspxShowProgressInfoPanel(\'' + this.name + '\')', 600);
  this.CleanUploadingInfoPanel();
  this.uploadingTimerID = _aspxSetInterval('aspxUploadProcessing(\'' + this.name + '\')', 1000);
 },
 EndProcessUploading: function() {
  this.helperUploadingState = null;
  this.uploadingInfo = null;
  this.selectedInputFileCount = null;
  if (this.uploadingTimerID != null)
   this.uploadingTimerID = _aspxClearInterval(this.uploadingTimerID);
  if(this.IsSlUploadHelperEnabled() && !this.isCancel)
   this.UploadForm();
 },
 GetHelperUploadingState: function() {
  if (!this.helperUploadingState) {
   var nextFileInfo = this.GetHelperNextFileInput(0, 0);
   this.helperUploadingState = {
    TotalFileLength: this.slUploadHelper.GetTotalLength(this.GetFileInputCountInternal()),
    FileIndexesCount: this.slUploadHelper.GetFileIndexesCount(this.GetFileInputCountInternal()),
    currentInputIndex: nextFileInfo.inputIndex,
    currentFileIndex: nextFileInfo.fileIndex,
    uploadedCurrentFileLength: 0,
    isLastChunk: false
   };
  }
  return this.helperUploadingState;
 },
 GetHelperNextFileInput: function(startInputIndex, startFileIndex) {
  var inputIndex = null;
  var fileIndex = startFileIndex;
  var isFound = false;
  var fileInputCount = this.GetFileInputCountInternal();
  for(var i = startInputIndex; i < fileInputCount; i++) {
   currentFileInfos = this.slUploadHelper.GetFileInfos(i);
   if(fileIndex < currentFileInfos.length) {
    inputIndex = i;
    isFound = true;
    break;
   }
   else
    fileIndex = 0;
  }
  return {
   inputIndex: isFound ? inputIndex : null,
   fileIndex: isFound ? fileIndex : null
  };
 },
 GetHelperRequestData: function() {
  var currentInputIndex = this.GetHelperUploadingState().currentInputIndex;
  var currentFileIndex = this.GetHelperUploadingState().currentFileIndex;
  var uploadedCurrentFileLength = this.GetHelperUploadingState().uploadedCurrentFileLength;
  var isLastChunk = false;
  var startPos = 0;
  var chunkLength = this.packetSize;
  var currentFileInfos = (currentInputIndex != null) ? this.slUploadHelper.GetFileInfos(currentInputIndex) : null;
  var currentFileInfo = (currentFileIndex != null) ? currentFileInfos[currentFileIndex] : null;
  var body = "";
  var isEmptyFile = false;
  if(currentFileInfo) {
   if(uploadedCurrentFileLength >= currentFileInfo.fileSize) {
    isEmptyFile = uploadedCurrentFileLength == 0 && currentFileInfo.fileSize == 0;
    if(isEmptyFile) {
     chunkLength = 0;
     uploadedCurrentFileLength = 1;
    }
    else {
     uploadedCurrentFileLength = 0;
     var nextFileInfo = this.GetHelperNextFileInput(currentInputIndex, currentFileIndex + 1);
     currentInputIndex = nextFileInfo.inputIndex;
     currentFileIndex = nextFileInfo.fileIndex;
     currentFileInfos = (currentInputIndex != null) ? this.slUploadHelper.GetFileInfos(currentInputIndex) : null;
     currentFileInfo = (currentFileIndex != null) ? currentFileInfos[currentFileIndex] : null;
     isEmptyFile = currentFileInfo.fileSize == 0;
     if(isEmptyFile) {
      chunkLength = 0;
      uploadedCurrentFileLength = 1;
     }
    }
   }
   if(!isEmptyFile && currentFileInfo) {
    if(uploadedCurrentFileLength < currentFileInfo.fileSize) {
     startPos = uploadedCurrentFileLength;
     uploadedCurrentFileLength += chunkLength;
     if(startPos + chunkLength > currentFileInfo.fileSize) {
      chunkLength = currentFileInfo.fileSize - startPos;
      uploadedCurrentFileLength = currentFileInfo.fileSize;
     }
    }
   }
   if(uploadedCurrentFileLength >= currentFileInfo.fileSize) {
    var nextFileInfo = this.GetHelperNextFileInput(currentInputIndex, currentFileIndex + 1);
    if(!nextFileInfo.inputIndex)
     isLastChunk = true;
   }
   var encodingData = this.slUploadHelper.ReadBase64StringData(currentInputIndex, currentFileIndex, startPos, chunkLength);
   body = this.slUploadHelper.BuildChunkRequest(
    currentInputIndex == 0 && currentFileIndex == 0 && startPos == 0,
    this.tempFolderPath,
    this.GetHelperUploadingState().TotalFileLength,
    this.GetHelperUploadingState().FileIndexesCount,
    currentInputIndex,
    currentFileIndex,
    currentFileInfo.fileSize,
    chunkLength,
    currentFileInfo.fileName,
    encodingData);
  }
  else
   isLastChunk = true;
  this.GetHelperUploadingState().currentInputIndex = currentInputIndex;
  this.GetHelperUploadingState().currentFileIndex = currentFileIndex;
  this.GetHelperUploadingState().uploadedCurrentFileLength = uploadedCurrentFileLength;
  this.GetHelperUploadingState().isLastChunk = isLastChunk;
  return body;
 },
 GetUploadingInfo: function() {
  if (!this.uploadingInfo) {
   this.uploadingInfo = {
    isUploadingStart: false,
    isComplete: false,
    currentFileName: "",
    currentContentType: "",
    uploadedLength: 0,
    totalLength: 0,
    progress: 0,
    errorText: ""
   };
  }
  return this.uploadingInfo;
 },
 UpdateUploadingInfo: function(responseXML) {
  var info = this.GetUploadingInfo();
  if (responseXML == null || this.GetXmlAttribute(responseXML, 'empty') == 'true') {
   if (info.isUploadingStart) {
    info.isUploadingStart = false;
    info.isComplete = true;
    info.progress = 100;
    info.uploadedLength = info.totalLength;
    this.SetButtonEnabled(this.GetCancelButtonCell(), false);
   }
   return;
  }
  info.isUploadingStart = true;
  info.errorText = this.GetXmlAttribute(responseXML, 'errorText');
  info.currentFileName = this.GetXmlAttribute(responseXML, 'fileName');
  info.currentContentType = this.GetXmlAttribute(responseXML, 'contentType');
  info.uploadedLength = parseInt(this.GetXmlAttribute(responseXML, 'size'));
  info.totalLength = parseInt(this.GetXmlAttribute(responseXML, 'totalSize'));
  info.progress = parseInt(this.GetXmlAttribute(responseXML, 'progress'));
 },
 UploadProcessing: function() {
  if (this.isProgressWaiting || this.isResponseWaiting) return;
  this.isProgressWaiting = true;
  var xmlHttp = this.CreateXmlHttpRequestObject();
  if (xmlHttp == null) {
   this.isProgressWaiting = false;
   this.EndProcessUploading();
   return;
  }
  if (!this.GetUploadingInfo().isComplete) {
   var url = this.progressHandlerPage + '?' + __aspxProgressHandlerKeyQueryParamName + '=' + this.GetProgressInfoKey();
   var httpMethod = "GET";
   var body = "";
   if(this.IsSlUploadHelperEnabled()) {
    url += "&" + __aspxHelperUploadingCallbackQueryParamName + "=" + this.name;
    httpMethod = "POST";
    body = this.GetHelperRequestData();
   }
   xmlHttp.open(httpMethod, url, true);
   xmlHttp.send(body);
   this.isResponseWaiting = true;
  }
  else
   this.EndProcessUploading();
  this.isProgressWaiting = false;
 },
 UploadAsyncXmlHttpResponse: function() {
  var xmlHttp = this.CreateXmlHttpRequestObject();
  if(xmlHttp && xmlHttp.readyState == 4) {
   var successful = false;
   if(xmlHttp.status == 200) {
    this.UpdateUploadingInfo(xmlHttp.responseXML);
    var info = this.GetUploadingInfo();
    successful = !info.errorText;
   }
   if(successful) {
    if(info.isUploadingStart || info.isComplete) {
     if(this.IsShowProgressPanel())
      this.UpdateUploadingInfoPanel(info);
     this.OnUploadingProgressChanged(this.GetSelectedInputFileCount(), info);
    }
   }
   else {
    if(this.IsSlUploadHelperEnabled()) {
     var text = (info && info.errorText != "") ? info.errorText : xmlHttp.statusText;
     this.UpdateCommonErrorDiv(text, true);
     this.GetHelperUploadingState().isLastChunk = true;
     this.CancelUploadingFileFromHelper();
    }
   }
   var isEndProcessUploading = (!this.GetUploadingInfo().isUploadingStart && !this.isInCallback)
    || (this.IsSlUploadHelperEnabled() && this.GetHelperUploadingState().isLastChunk)
    || this.uploadingTimerID == -1;
   if(isEndProcessUploading)
    this.EndProcessUploading();
   else if(this.IsSlUploadHelperEnabled())
    _aspxSetTimeout('aspxUploadProcessing(\'' + this.name + '\')', 0);
   this.isResponseWaiting = false;
   if(__aspxIE && __aspxBrowserVersion < 8)
    this.xmlHttpRequest = null;
  }
 },
 UploadAsyncCancelProcessing: function() {
  if(this.isResponseWaiting)
   _aspxSetTimeout('aspxUploadAsyncCancelProcessing(\'' + this.name + '\')', 100);
  else {
   var xmlHttp = this.CreateXmlHttpRequestObject();
   if(xmlHttp && this.IsSlUploadHelperEnabled()) {
    var url = this.progressHandlerPage + '?' + __aspxProgressHandlerKeyQueryParamName + '=' + this.GetProgressInfoKey();
    url += "&" + __aspxHelperUploadingCallbackQueryParamName + "=" + this.name;
    xmlHttp.open("POST", url, false);
    xmlHttp.send(this.slUploadHelper.BuildCancelRequest());
   }
  }
 },
 ShowProgressInfoPanel: function(show) {
  var inputsTable = this.GetUploadInputsTable();
  _aspxSetStyleSize(this.GetProgressPanel(), inputsTable.clientWidth, inputsTable.clientHeight);
  _aspxSetElementDisplay(inputsTable, !show);
  _aspxSetElementDisplay(this.GetProgressPanel(), show);
  if (show) {
   var progressControl = this.GetProgressControl();
   if (progressControl != null)
    progressControl.AdjustControl();
  }
  this.SetButtonEnabled(this.GetCancelButtonCell(), true);
 },
 CleanUploadingInfoPanel: function() {
  this.UpdateProgress(0);
 },
 UpdateUploadingInfoPanel: function(info) {
  this.UpdateProgress(info.progress);
 },
 UpdateProgress: function(percent) {
  if (!(percent > 0 && percent <= 100))
   percent = percent > 0 ? 100 : 0;
  var element = this.GetProgressControl();
  if (element != null)
   element.SetPosition(percent);
 },
 AreEmptyInputs: function() {
  for (var i = 0; i < this.GetFileInputCountInternal(); i++)
   if (_aspxTrim(this.GetText(i)) != "") return false;
  return true;
 },
 ClearInputText: function() {
  for (var i = 0; i < this.GetFileInputCountInternal(); i++) {
   this.ChangeEventsToFileInput(false, i);
   var textBoxCell = this.GetTextBoxCell(i);
   if(_aspxIsExistsElement(textBoxCell)) {
    if(this.IsSlUploadHelperEnabled()) {
     this.slUploadHelper.ClearFileInfos(i);
     this.GetFileFakeInputElement(i).value = "";
    }
    else {
     textBoxCell.innerHTML = this.clearFileInputTempalteHtml;
     this.RedefineInputAttributes(textBoxCell, i);
    }
   }
   this.ChangeEventsToFileInput(true, i);
  }
 },
 UpdateCommonErrorDiv: function(text, display) {
  var commonErrorDiv = this.GetCommonErrorDivElement();
  if (commonErrorDiv) {
   commonErrorDiv.innerHTML = text;
   _aspxSetElementDisplay(commonErrorDiv, display);
  }
 },
 GetXmlAttribute: function(xmlDoc, attrName) {
  return xmlDoc.documentElement.getAttribute(attrName);
 },
 ProcessResponse: function() {
  try {
   return eval(this.GetFakeIframeResponseString());
  }
  catch (e) { }
  return null;
 },
 ClearErrorMessageCell: function() {
  for (var i = 0; i < this.GetFileInputCountInternal(); i++)
   this.UpdateErrorMessageCell(i, "", true);
 },
 UpdateErrorMessageCell: function(index, errorText, isValid) {
  if (this.GetErrorRow(index)) {
   var errorCell = this.GetErrorCell(index);
   _aspxSetElementDisplay(this.GetErrorRow(index), !isValid);
   if (errorText != "")
    errorCell.innerHTML = errorText;
  }
 },
 ValidateWindowsFileNames: function() {
  for (var i = 0; i < this.GetFileInputCountInternal(); i++) {
   if (!ASPxClientUploadControl.IsValidWindowsFileName(_aspxTrim(this.GetText(i)))) {
    alert(this.invalidWindowsPathErrorText.replace("{0}", this.GetText(i)));
    return false;
   }
  }
  return true;
 },
 ValidateInputFiles: function(validateObj) {
  if(this.IsSlUploadHelperEnabled()) {
   var isValid = true;
   var fileInputCount = this.GetFileInputCountInternal();
   for (var inputIndex = 0; inputIndex < fileInputCount; inputIndex++) {
    var fileInfos = this.slUploadHelper.GetFileInfos(inputIndex);
    if(fileInfos) {
     for (var fileIndex = 0; fileIndex < fileInfos.length; fileIndex++) {
      if(this.validationSettings.maxFileSize != null) {
       if(fileInfos[fileIndex].fileSize > this.validationSettings.maxFileSize) {
        validateObj.commonErrorText = this.validationSettings.maxFileSizeErrorText.replace("{0}", this.validationSettings.maxFileSize);
        this.UpdateErrorMessageCell(inputIndex, validateObj.commonErrorText, false);
        isValid = false;
        break;
       }
      }
      if(this.validationSettings.allowedFileExtensions != null) {
       var fileExtension = ASPxClientUploadControl.GetFileExtension(fileInfos[fileIndex].fileName).toLowerCase();
       if(_aspxArrayIndexOf(this.validationSettings.allowedFileExtensions, fileExtension) == -1) {
        validateObj.commonErrorText = this.validationSettings.notAllowedFileExtensionErrorText;
        this.UpdateErrorMessageCell(inputIndex, validateObj.commonErrorText, false);
        isValid = false;
        break;
       }
      }
     }
    }
   }
   return isValid;
  }
  return true;
 },
 WriteResponseString: function(responseString) {
  try {
   this.GetFakeIframeDocument().body.innerHTML = responseString;
  }
  catch (e) { }
 },
 OnBrowserWindowResizeInternal: function(evt) {
  if(this.GetMainElement())
   this.AdjustControlCore();
 },
 OnCompleteFileUpload: function() {
  var responseObj = null;
  var commonErrorText = '';
  if (this.GetIsResponseValid()) {
   responseObj = this.ProcessResponse();
   if(responseObj.customJSProperties) {
    for(var property in responseObj.customJSProperties)
     this[property] = responseObj.customJSProperties[property];
   }
   for (var i = 0; i < this.GetFileInputCountInternal(); i++) {
    this.UpdateErrorMessageCell(i, responseObj.errorTexts[i], responseObj.isValidArray[i]);
    if (this.GetText(i) != "")
     this.RaiseFileUploadComplete(i, responseObj);
   }
   this.ClearInputText();
  }
  if (this.IsShowProgressPanel())
   this.UpdateProgress(100);
  if (!this.isCancel) {
   commonErrorText = responseObj != null ? responseObj.commonErrorText : this.unspecifiedErrorText;
   if(commonErrorText != '')
    this.UpdateCommonErrorDiv(commonErrorText, true);
  }
  this.isInCallback = false;
  this.responseHashTable = {};
  this.SetEnabledInternal(true);
  if(this.IsShowProgressPanel())
   this.ShowProgressInfoPanel(false);
  if(responseObj)
   this.RaiseFilesUploadComplete(responseObj);
  else
   this.RaiseFilesUploadComplete({
    commonErrorText: commonErrorText,
    commonCallbackData: ""
   });
  if (__aspxIE) {
   try {
    this.GetFakeIframeDocument().write("");
    this.GetFakeIframeDocument().close();
   }
   catch (e) { }
  }
 },
 OnUploadingProgressChanged: function(fileCount, info) {
  this.RaiseUploadingProgressChanged(fileCount, info.currentFileName, info.totalLength, info.uploadedLength, info.progress);
 },
 OnTextChanged: function(index) {
  if(!this.isNative)
   this.GetFileFakeInputElement(index).value = ASPxClientUploadControl.GetFileName(this.GetValue(index));
  this.RaiseTextChanged(index);
 },
 OnPluginLoaded: function(index) {
 },
 OnPluginError: function(index) {
  if(!this.pluginError) {
   this.pluginError = true;
   this.SetVisibleSlPluginLinkTable(true);
  }
 },
 OnFileInputMouseMove: function(evt, index) {
  this.OnMouseMoveInFileInputElement(evt, index);
 },
 OnFileInputMouseOut: function(evt, index) {
  this.ResetFileInputPosition(index);
 },
 OnFileInputMouseDown: function(evt, index) {
  var isOverBrowseButton = this.IsMouseOverBrowseButton(evt, index);
  this.ChangeButtonPressedState(this.GetBrowseButtonCell(index), isOverBrowseButton);
 },
 OnFileInputMouseUp: function(evt, index) {
  var focusElement = this.GetFileFakeInputElement(index)
  if(this.IsMouseOverBrowseButton(evt, index))
   focusElement = _aspxGetChildByTagName(this.GetBrowseButtonCell(index), "A", 0);
  window.setTimeout(function() {
   focusElement.focus();
  }, 100);
 },
 OnTextBoxMouseMove: function(evt, index) {
  this.OnMouseMoveInFakeElement(evt, index);
 },
 OnTextBoxMouseOut: function(evt, index) {
  this.OnMouseOutInFakeElement(evt, index);
 },
 OnBrowseButtonMouseMove: function(evt, index) {
  this.OnMouseMoveInFakeElement(evt, index);
 },
 OnBrowseButtonMouseOut: function(evt, index) {
  this.OnMouseOutInFakeElement(evt, index);
  this.ChangeButtonHoveredState(this.GetBrowseButtonCell(index), false);
 },
 OnMouseMoveInFakeElement: function(evt, index) {
  if(!this.GetFileFakeInputElement(index).disabled) {
   var isOverBrowseButton = this.IsMouseOverBrowseButton(evt, index);
   this.SetFileInputPosition(index, _aspxGetEventX(evt), _aspxGetEventY(evt), isOverBrowseButton);
   this.ChangeButtonHoveredState(this.GetBrowseButtonCell(index), isOverBrowseButton);
  }
 },
 OnMouseOutInFakeElement: function(evt, index) {
  if( !(this.IsMouseOverTextBox(evt, index) || this.IsMouseOverBrowseButton(evt, index)) )
   this.ResetFileInputPosition(index);
 },
 OnMouseMoveInFileInputElement: function(evt, index) {
  if(!this.GetFileFakeInputElement(index).disabled) {
   var isOverBrowseButton = this.IsMouseOverBrowseButton(evt, index);
   var isOverTextBoxButton = this.IsMouseOverTextBox(evt, index);
   if(isOverTextBoxButton || isOverBrowseButton) {
    this.SetFileInputPosition(index, _aspxGetEventX(evt), _aspxGetEventY(evt), isOverBrowseButton);
    this.ChangeButtonHoveredState(this.GetBrowseButtonCell(index), isOverBrowseButton);
   }
   else
    this.ResetFileInputPosition(index);
  }
 },
 IsFileUploadCanceled: function(validateObj) {
  var isCancel = this.RaiseFileUploadStart();
  if (!isCancel)
   this.isInCallback = true;
  else
   validateObj.commonErrorText = this.uploadWasCanceledErrorText;
  return isCancel;
 },
 IsMouseOverElement: function(mouseEvt, element) {
  var x = _aspxGetAbsoluteX(element);
  var y = _aspxGetAbsoluteY(element);
  var w = element.offsetWidth;
  var h = element.offsetHeight;
  var eventX = _aspxGetEventX(mouseEvt);
  var eventY = _aspxGetEventY(mouseEvt);
  return (eventX > x && eventX < (x + w) && eventY > y && eventY < (y + h));
 },
 IsMouseOverTextBox: function(evt, index) {
  return this.IsMouseOverElement(evt, this.GetTextBoxCell(index));
 },
 IsMouseOverBrowseButton: function(evt, index) {
  return this.IsMouseOverElement(evt, this.GetBrowseButtonCell(index));
 },
 SetFileInputPosition: function (index, x, y, isChooseButton) {
  var fileInput = this.GetFileSelectorElement(index);
  var space = 10;
  var xPos = x;
  var yPos = y;
  var width = fileInput.offsetWidth;
  var height = fileInput.offsetHeight;
  xPos -= this.IsRightToLeft() ? space : (width - space);
  yPos -= height/2;
  _aspxSetAbsoluteY(fileInput, yPos);
  _aspxSetAbsoluteX(fileInput, xPos);
  this.SetFileInputCursor(index, isChooseButton);
 },
 SetFileInputCursor: function(index, isChooseButton) {
  var fileSelectorElement = this.GetFileSelectorElement(index);
  var className = fileSelectorElement.className;
  className = className.replace(" " + __aspxFITextBoxHoverDocumentClassName, "").replace(" " + __aspxFIButtonHoverDocumentClassName, "");
  className += " " + (isChooseButton ? __aspxFIButtonHoverDocumentClassName : __aspxFITextBoxHoverDocumentClassName);
  fileSelectorElement.className = className;
  if(this.IsSlUploadHelperEnabled())
   this.slUploadHelper.SetCursorStyle(index, _aspxGetCurrentStyle(fileSelectorElement)["cursor"]);
 },
 ResetFileInputPosition: function(index) {
  this.GetFileSelectorElement(index).style.top = '-5000px';
 },
 RaiseUploadingProgressChanged: function(fileCount, currentFileName, totalContentLength, uploadedContentLength, progress) {
  if (!this.UploadingProgressChanged.IsEmpty()) {
   var args = new ASPxClientUploadControlUploadingProgressChangedEventArgs(fileCount, currentFileName, totalContentLength, uploadedContentLength, progress);
   this.UploadingProgressChanged.FireEvent(this, args);
  }
 },
 RaiseTextChanged: function(index) {
  if (!this.TextChanged.IsEmpty()) {
   var args = new ASPxClientUploadControlTextChangedEventArgs(index);
   this.TextChanged.FireEvent(this, args);
  }
 },
 RaiseFileUploadComplete: function(index, responseObj) {
  if (!this.FileUploadComplete.IsEmpty()) {
   var args = new ASPxClientUploadControlFileUploadCompleteEventArgs(index, responseObj.isValidArray[index],
    responseObj.errorTexts[index], responseObj.callbackDataArray[index]);
   this.FileUploadComplete.FireEvent(this, args);
  }
 },
 RaiseFilesUploadComplete: function(responseObj) {
  var args = new ASPxClientUploadControlFilesUploadCompleteEventArgs(responseObj.commonErrorText, responseObj.commonCallbackData);
  this.FilesUploadComplete.FireEvent(this, args);
 },
 RaiseFileUploadStart: function() {
  var ret = false;
  if (!this.FileUploadStart.IsEmpty()) {
   var args = new ASPxClientUploadControlFileUploadStartEventArgs(false);
   this.FileUploadStart.FireEvent(this, args);
   ret = args.cancel;
  }
  return ret;
 },
 RaiseFileInputCountChanged: function() {
  if (!this.FileInputCountChanged.IsEmpty()) {
   var args = new ASPxClientEventArgs();
   this.FileInputCountChanged.FireEvent(this, args);
  }
 },
 ClearText: function() {
  this.ClearInputText();
 },
 GetText: function(index) {
  if (!_aspxIsExists(index))
   index = 0;
  var value = this.GetValue(index);
  return value != null ? value : "";
 },
 UploadFile: function() {
  this.UploadFileFromUser();
 },
 Upload: function() {
  this.UploadFileFromUser();
 },
 Cancel: function() {
  this.CancelUploadingFileFromUser();
 },
 GetFileInputCount: function() {
  return this.GetFileInputCountInternal();
 },
 SetFileInputCount: function(count) {
  var lastCount = this.GetFileInputCountInternal();
  if(count == lastCount) return;
  if(lastCount < count) {
   for(var i = 0; i < count - lastCount; i++)
    this.AddFileInput();
  } else {
   for(var i = lastCount; i > count; i--)
    this.RemoveFileInput();
  }
 },
 SetAddButtonText: function(text) {
  this.SetAddButtonTextInternal(text);
 },
 SetUploadButtonText: function(text) {
  this.SetUploadButtonTextInternal(text);
 },
 GetAddButtonText: function() {
  return this.GetAddButtonTextInternal();
 },
 GetUploadButtonText: function() {
  return this.GetUploadButtonTextInternal();
 }
});
ASPxClientUploadControl.Cast = ASPxClientControl.Cast;
var windowsFileNameRegExpTemplate = "^([a-zA-Z]\\:|\\\\\\\\[^\\/\\\\:*?\\\"<>|]+\\\\[^\\/\\\\:*?\\\"<>|]+)(\\\\[^\\/\\\\:*?\\\"<>|]+)+(\\.[^\\/\\\\:*?\\\"<>|]+)?$";
windowsRootDirectoryNameRegExpTemplate = "[a-zA-Z]\\:";
ASPxClientUploadControl.IsValidWindowsFileName = function(fileName) {
 var windowsRootDirectoryNameRegExp = new RegExp(windowsRootDirectoryNameRegExpTemplate, "gi");
 var windowsFileNameRegExp = new RegExp(windowsFileNameRegExpTemplate, "gi");
 return (fileName == "" || windowsFileNameRegExp.test(fileName)) || (fileName.length == 3 && windowsRootDirectoryNameRegExp.test(fileName));
}
ASPxClientUploadControl.GetFileName = function(filePath) {
 if(!ASPxClientUploadControl.IsValidWindowsFileName(filePath))
  return filePath;
 var windowsFileNameRegExp = new RegExp(windowsFileNameRegExpTemplate, "gi");
 return filePath.replace(windowsFileNameRegExp, '$2').replace('\\', '');
}
ASPxClientUploadControl.GetFileExtension = function(fileName) {
 return fileName.replace(/.*?(\.[^.\\\/:*?\"<>|]+$)/, "$1");
}
ASPxClientUploadControlFileUploadStartEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(cancel) {
  this.constructor.prototype.constructor.call(this);
  this.cancel = cancel;
 }
});
ASPxClientUploadControlFileUploadCompleteEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(inputIndex, isValid, errorText, callbackData){
  this.constructor.prototype.constructor.call(this);
  this.inputIndex = inputIndex;
  this.isValid = isValid;
  this.errorText = errorText;
  this.callbackData = callbackData;
 }
});
ASPxClientUploadControlFilesUploadCompleteEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(errorText, callbackData){
  this.constructor.prototype.constructor.call(this);
  this.errorText = errorText;
  this.callbackData = callbackData;
 }
});
ASPxClientUploadControlTextChangedEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(inputIndex){
  this.constructor.prototype.constructor.call(this);
  this.inputIndex = inputIndex;
 }
});
ASPxClientUploadControlUploadingProgressChangedEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(fileCount, currentFileName, totalContentLength, uploadedContentLength, progress){
  this.constructor.prototype.constructor.call(this);
  this.fileCount = fileCount;
  this.currentFileName = currentFileName;
  this.totalContentLength = totalContentLength;
  this.uploadedContentLength = uploadedContentLength;
  this.progress = progress;
 }
});
ASPxClientSlUploadHelper = _aspxCreateClass(null, {
 constructor: function(uploadControl) {
  this.uploadControl = uploadControl;
 },
 CreateSlObject: function(source, inputIndex) {
  var slObjectId = this.uploadControl.GetSlUploadHelperElementID(inputIndex);
  var controlName = this.uploadControl.name;
  var properties = { width: '70px', height: '22px' };
  var events = {};
  events.onLoad = 'slOnLoad_' + slObjectId;
  window[events.onLoad] = new Function("aspxSLOnLoad('" + this.uploadControl.name + "', '" + inputIndex + "');");
  events.onError = 'slOnError_' + slObjectId;
  window[events.onError] = new Function("aspxSLOnError('" + this.uploadControl.name + "', '" + inputIndex + "');");
  var parentElement = document.createElement("DIV");
  parentElement.innerHTML = this.BuildHTML(source, slObjectId, controlName, inputIndex, properties, events);
  return parentElement.firstChild;
 },
 SetCursorStyle: function(inputIndex, cursorStyle) {
  if(this.IsObjectLoaded(inputIndex)) {
   var slElement = this.uploadControl.GetSlUploadHelperElement(inputIndex);
   slElement.content.sl.SetCursorStyle(cursorStyle);
  }
 },
 ClearFileInfos: function(inputIndex) {
  if(this.IsObjectLoaded(inputIndex)) {
   var slElement = this.uploadControl.GetSlUploadHelperElement(inputIndex);
   return slElement.content.sl.ClearFileInfos();
  }
 },
 GetFileInfos: function(inputIndex) {
  if(this.IsObjectLoaded(inputIndex)) {
   var slElement = this.uploadControl.GetSlUploadHelperElement(inputIndex);
   return eval(slElement.content.sl.FileInfos);
  }
  return [];
 },
 GetFileIndexesCount: function(fileInputCount) {
  var count = 0;
  for(var inputIndex = 0; inputIndex < fileInputCount; inputIndex++) {
   var fileInfos = this.GetFileInfos(inputIndex);
   count += fileInfos.length > 0 ? fileInfos.length : 1;
  }
  return count;
 },
 GetTotalLength: function(fileInputCount) {
  var totalFileLength = 0;
  for(var inputIndex = 0; inputIndex < fileInputCount; inputIndex++) {
   var fileInfos = this.GetFileInfos(inputIndex);
   for(var fileIndex = 0; fileIndex < fileInfos.length; fileIndex++)
    totalFileLength += parseInt(fileInfos[fileIndex].fileSize);
  }
  return totalFileLength;
 },
 ReadBase64StringData: function(inputIndex, fileIndex, startPos, length) {
  if(this.IsObjectLoaded(inputIndex)) {
   var slElement = this.uploadControl.GetSlUploadHelperElement(inputIndex);
   return slElement.content.sl.ReadBase64StringData(fileIndex, startPos, length);
  }
  return null;
 },
 BuildChunkRequest: function(isNewUploading, tempFolderPath, totalSize, fileIndexesCount, inputIndex, fileIndex, fileSize, chunkSize, fileName, encodingData) {
  var index = 0;
  for(var i = 0; i < inputIndex; i++) {
   var fileInfos = this.GetFileInfos(i);
   index += fileInfos.length > 0 ? fileInfos.length : 1;
  }
  index += fileIndex;
  var request = "";
  request += "IsNewUploading:" + (isNewUploading ? "true" : "false") + "\r\n";
  request += "TempFolderPath:" + tempFolderPath + "\r\n";
  request += "TotalSize:" + totalSize + "\r\n";
  request += "FileIndexesCount:" + fileIndexesCount + "\r\n";
  request += "FileIndex:" + index + "\r\n";
  request += "FileSize:" + fileSize + "\r\n";
  request += "ChunkSize:" + chunkSize + "\r\n";
  request += "FileName:" + fileName + "\r\n";
  request += "EncodingData:" + encodingData;
  return request;
 },
 BuildCancelRequest: function() {
  return "IsCancel:true";
 },
 BuildHTML: function(source, id, controlName, inputIndex, properties, events) {
  var sb = [];
  sb.push('<object type="application/x-silverlight-2" data="data:application/x-silverlight-2,"');
  sb.push(' id="' + id + '"');
  if(properties.width != null) sb.push(' width="' + properties.width + '"');
  if(properties.height != null) sb.push(' height="' + properties.height + '"');
  var opacityStyle = "";
  if(__aspxIE)
   opacityStyle = "filter: alpha(opacity=1);";
  else
   opacityStyle = "opacity: 0.01;";
  sb.push(' style="position: absolute; background-color: transparent; top: -5000px; ' + opacityStyle + '"');
  sb.push('>');
  sb.push('<param name="source" value="' + source + '" />');
  sb.push('<param name="background" value="Transparent" />');
  sb.push('<param name="windowless" value="true" />');
  sb.push('<param name="minRuntimeVersion" value="3.0.40818.0" />');
  sb.push('<param name="initParams" value="controlName=' + controlName + ', inputIndex=' + inputIndex + '" />');
  if(events.onLoad)
   sb.push('<param name="onLoad" value="' + events.onLoad + '" />');
  if(events.onError)
   sb.push('<param name="onError" value="' + events.onError + '" />');
  sb.push("</object>");
  return sb.join("");
 },
 RedefineSlObjectAttributes: function(parent, inputIndex, isNewElement) {
  var slElement = _aspxGetChildByTagName(parent, "OBJECT", 0);
  if(slElement) {
   var slObjectId = this.uploadControl.GetSlUploadHelperElementID(inputIndex);
   var controlName = this.uploadControl.name;
   slElement.id = slObjectId;
   if(isNewElement == true) {
    if(__aspxIE && __aspxBrowserVersion == 8) {
     parent.insertBefore(
      this.CreateSlObject(this.uploadControl.slUploadHelperUrl, inputIndex),
      slElement
     );
     parent.removeChild(slElement);
    }
    else {
     if(__aspxIE)
      _aspxRemoveAttribute(slElement, "data");
     var onLoad = 'slOnLoad_' + slObjectId;
     window[onLoad] = new Function("aspxSLOnLoad('" + this.uploadControl.name + "', '" + inputIndex + "');");
     var onError = 'slOnError_' + slObjectId;
     window[onError] = new Function("aspxSLOnError('" + this.uploadControl.name + "', '" + inputIndex + "');");
     var params = _aspxGetElementsByTagName(parent, "param");
     for(var i = 0; i < params.length; i++) {
      switch(_aspxGetAttribute(params[i], "name")) {
       case "initParams":
        _aspxSetAttribute(params[i], "value", "controlName=" + controlName + ", inputIndex=" + inputIndex);
        break;
       case "onLoad":
        _aspxSetAttribute(params[i], "value", onLoad);
        break;
       case "onError":
        _aspxSetAttribute(params[i], "value", onError);
        break;
      }
     }
    }
   }
   else if(this.IsObjectLoaded(inputIndex))
    slElement.content.sl.RedefineAttributes(controlName, inputIndex);
  }
 },
 RedefineSlObjectAttributesInHostElement: function(inputIndex, newInputIndex, isNewElement) {
  var slHost = this.uploadControl.GetSlUploadHostElement();
  if(slHost) {
   if(isNewElement)
    slHost.appendChild(this.CreateSlObject(this.uploadControl.slUploadHelperUrl, newInputIndex));
   else {
    var slElement = this.uploadControl.GetSlUploadHelperElement(inputIndex);
    if(slElement) {
     slElement.id = this.uploadControl.GetSlUploadHelperElementID(newInputIndex);
     if(this.IsObjectLoaded(newInputIndex))
      slElement.content.sl.RedefineAttributes(this.uploadControl.name, newInputIndex);
    }
   }
  }
 },
 RemoveSlObjectInHostElement: function(inputIndex) {
  var slHost = this.uploadControl.GetSlUploadHostElement();
  if(slHost) {
   var slElement = this.uploadControl.GetSlUploadHelperElement(inputIndex);
   if(slElement)
    slHost.removeChild(slElement);
  }
 },
 IsObjectLoaded: function(index) {
  var slElement = this.uploadControl.GetSlUploadHelperElement(index);
  try {
   if(slElement && slElement.content && slElement.content.sl)
    return true;
  }
  catch (e) { }
  return false;
 }
});
ASPxClientSlUploadHelper.IsPluginInstalled = function() {
 if(!ASPxClientSlUploadHelper.isSilverlightInstalled) {
  try{
   if(typeof(ActiveXObject) != 'undefined') {
    var slControl = new ActiveXObject('AgControl.AgControl');
    if(slControl != null)
     ASPxClientSlUploadHelper.isSilverlightInstalled = true;
   }
   else if(navigator.plugins["Silverlight Plug-In"])
    ASPxClientSlUploadHelper.isSilverlightInstalled = true;
  } catch(e) { }
 }
 return ASPxClientSlUploadHelper.isSilverlightInstalled;
};
function aspxUTextChanged(name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnTextChanged(index);
}
function aspxUFileInputMouseMove(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnFileInputMouseMove(evt, index);
}
function aspxUFileInputMouseOut(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnFileInputMouseOut(evt, index);
}
function aspxUFileInputMouseDown(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnFileInputMouseDown(evt, index);
}
function aspxUFileInputMouseUp(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnFileInputMouseUp(evt, index);
}
function aspxUTextBoxMouseMove(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnTextBoxMouseMove(evt, index);
}
function aspxUTextBoxMouseOut(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnTextBoxMouseOut(evt, index);
}
function aspxUBrowseButtonMouseMove(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnBrowseButtonMouseMove(evt, index);
}
function aspxUBrowseButtonMouseOut(evt, name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnBrowseButtonMouseOut(evt, index);
}
function aspxUAddFileInputClick(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.AddFileInput(true);
}
function aspxURemoveFileInputClick(name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.RemoveFileInput(index, true);
}
function aspxUUploadFileClick(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.Upload();
}
function aspxUCancelFileClick(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.Cancel();
}
function aspxFakeUploadIframeOnLoad(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if ((uploader != null) && uploader.isInCallback)
  uploader.OnCompleteFileUpload();
}
function aspxUploadProcessing(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.UploadProcessing();
}
function aspxUploadAsyncXmlHttpResponse(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.UploadAsyncXmlHttpResponse();
}
function aspxUploadAsyncCancelProcessing(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.UploadAsyncCancelProcessing();
}
function aspxShowProgressInfoPanel(name) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null && uploader.isInCallback)
  uploader.ShowProgressInfoPanel(true);
}
function aspxSLOnLoad(name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if(uploader != null)
  uploader.OnPluginLoaded(index);
};
function aspxSLOnError(name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if(uploader != null)
  uploader.OnPluginError(index);
};
function aspxSLOnFileSelectionChanged(name, index) {
 var uploader = aspxGetControlCollection().Get(name);
 if (uploader != null)
  uploader.OnTextChanged(index);
}

