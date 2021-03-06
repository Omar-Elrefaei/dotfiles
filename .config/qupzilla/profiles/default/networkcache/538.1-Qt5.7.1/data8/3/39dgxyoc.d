   �         .http://curriculum.qsi.org/DXR.axd?r=1_73-Lp3X3     %�-���     %yk���         
     O K           �      Cache-Control   public, max-age=31536000   Content-Type   text/javascript   Content-Encoding   gzip   Expires   Tue, 18 Dec 2012 21:13:05 GMT   Last-Modified   Mon, 19 Dec 2011 21:13:05 GMT   Server   Microsoft-IIS/7.5   X-Powered-By   ASP.NET   Date   Sat, 21 Oct 2017 11:47:44 GMT ASPxSplitterHelper = _aspxCreateClass(null, {
 constructor: function(splitter) {
  this.splitter = splitter;
  this.clientStateElementId = this.splitter.name + "_CS";
 },
 GetClientStateElement: function() {
  return ASPxCacheHelper.GetCachedValue(this, this.clientStateElementId, function(){
   return _aspxGetElementById(this.clientStateElementId);
  });
 },
 GetMoveMaxDeltaSize: function(deltaSize) {
  if(deltaSize == 0)
   return 0;
  if(this.isHeavyUpdate) {
   var parent = this.splitter.moveLeftPane.parent;
   var totalSize = 0, minSize = 0;
   for(var i = 0; i < parent.panes.length; i++) {
    var pane = parent.panes[i];
    if(pane.isSizePx)
     continue;
    if(pane.collapsed) {
     totalSize += pane.GetSizeDiff(pane.isVertical);
     minSize += pane.GetSizeDiff(pane.isVertical);
    }
    else {
     totalSize += pane.GetOffsetSize();
     minSize += pane.GetMinSize();
    }
   }
   if(this.moveRightPane.isSizePx) {
    deltaSize = this.GetPaneMaxDeltaSize(this.splitter.moveRightPane, -deltaSize);
    deltaSize = this.GetMaxDeltaSize(totalSize, minSize, Number.MAX_VALUE, -deltaSize);
   }
   else {
    deltaSize = this.GetMaxDeltaSize(totalSize, minSize, Number.MAX_VALUE, -deltaSize);
    deltaSize = this.GetPaneMaxDeltaSize(this.splitter.moveLeftPane, -deltaSize);
   }
  }
  else {
   deltaSize = this.GetPaneMaxDeltaSize(this.splitter.moveRightPane, -deltaSize);
   deltaSize = this.GetPaneMaxDeltaSize(this.splitter.moveLeftPane, -deltaSize);
  }
  return deltaSize;
 },
 GetPaneMaxDeltaSize: function(pane, deltaSize) {
  return this.GetMaxDeltaSize(pane.GetOffsetSize(), pane.GetMinSize(), pane.maxSize, deltaSize);
 },
 GetMaxDeltaSize: function(size, min, max, deltaSize) {
  var minDeltaSize = Math.floor(min - size);
  var maxDeltaSize = Math.floor(max - size);
  if(deltaSize < minDeltaSize)
   return (size < min) ? 0 : minDeltaSize;
  else if(deltaSize > maxDeltaSize)
   return (size > max) ? 0 : maxDeltaSize;
  return deltaSize;
 },
 GetCurrentPos: function() {
  return this.splitter.moveIsVertical ? ASPxClientSplitter.CurrentYPos : ASPxClientSplitter.CurrentXPos;
 },
 SetResizingPanelVisibility: function(visible, cursor) {
  var resizingPanel = ASPxCacheHelper.GetCachedValue(this, "resizingPanel", function(){
   var resizingPanel = document.createElement("DIV");
   resizingPanel.style.overflow = "hidden";
   resizingPanel.style.position = "absolute";
   if(__aspxIE) {
    resizingPanel.style.backgroundColor = "White";
    resizingPanel.style.filter = "alpha(opacity=1)";
   }
   resizingPanel.isVisible = false;
   return resizingPanel;
  });
  if(resizingPanel.isVisible != visible) {
   if(visible) {
    var mainElement = this.splitter.GetMainElement();
    _aspxSetStyleSize(resizingPanel, mainElement.offsetWidth, mainElement.offsetHeight);
    if(cursor)
     resizingPanel.style.cursor = cursor;
    mainElement.parentNode.appendChild(resizingPanel);
    _aspxSetAbsoluteX(resizingPanel, _aspxGetAbsoluteX(mainElement));
    _aspxSetAbsoluteY(resizingPanel, _aspxGetAbsoluteY(mainElement));
   }
   else
    resizingPanel.parentNode.removeChild(resizingPanel);
   resizingPanel.isVisible = visible;
  }
 }
});
ASPxSplitterHelper.Resize = function(pane1, pane2, deltaSize) {
 if(pane1.isSizePx || pane2.isSizePx) {
  if(pane1.isSizePx)
   pane1.size += deltaSize;
  if(pane2.isSizePx)
   pane2.size -= deltaSize;
 }
 else {
  var c = (pane1.size + pane2.size) / (pane1.GetOffsetSize() + pane2.GetOffsetSize());
  pane1.size = c * (pane1.GetOffsetSize() + deltaSize);
  pane2.size = c * (pane2.GetOffsetSize() - deltaSize);
 }
};
ASPxSplitterPaneHelper = _aspxCreateClass(null, {
 constructor: function(pane) {
  this.pane = pane;
  this.indexPath = this.GetIndexPath();
  var paneIdPostfix = this.pane.isRootPane ? "" : "_" + this.indexPath;
  var separatorIdPostfix = paneIdPostfix + "_S";
  this.postfixes = {
   pane: paneIdPostfix,
   separator: separatorIdPostfix,
   table: paneIdPostfix + "_T",
   contentContainer: paneIdPostfix + "_CC",
   collapseForwardButton: separatorIdPostfix + "_CF",
   collapseBackwardButton: separatorIdPostfix + "_CB",
   collapseButtonsSeparator: separatorIdPostfix + "_CS"
  };
  this.buttonsTableExists = !!this.GetCollapseBackwardButton();
  this.separatorImageExists = !!this.GetCollapseButtonsSeparatorImage();
  this.buttonsExists = this.buttonsTableExists || this.separatorImageExists;
 },
 GetCachedValue: function(name, func) {
   return ASPxCacheHelper.GetCachedValue(this, name, func);
 },
 DropCachedValue: function(name) {
  ASPxCacheHelper.DropCachedValue(this, name);
 },
 GetIndexPath: function() {
  if(this.pane.isRootPane)
   return "";
  var parentPane = this.pane.parent;
  if(parentPane.isRootPane)
   return "" + this.pane.index;
  return parentPane.helper.indexPath + __aspxItemIndexSeparator + this.pane.index;
 },
 GetCachedElement: function(idPostfix) {
  return this.GetCachedValue(idPostfix, function(){
   return this.pane.splitter.GetChild(idPostfix);
  });
 },
 DropCachedElement: function(idPostfix) {
  this.DropCachedValue(idPostfix);
 },
 GetPaneElement: function() {
  return this.GetCachedElement(this.postfixes.pane);
 },
 GetTableElement: function() {
  return this.GetCachedElement(this.postfixes.table);
 },
 GetContentContainerElement: function() {
  return this.GetCachedElement(this.postfixes.contentContainer);
 },
 DropContentContainerElementFromCache: function() {
  this.DropCachedElement(this.postfixes.contentContainer);
 },
 GetSeparatorElementId: function() {
  return this.pane.splitter.name + this.postfixes.separator;
 },
 GetSeparatorElement: function() {
  return this.GetCachedElement(this.postfixes.separator);
 },
 GetSeparatorDivElement: function() {
  return this.GetCachedValue("separatorDivElement", function(){
   var separatorElement = this.GetSeparatorElement();
   return separatorElement ? separatorElement.childNodes[0] : null;
  });
 },
 GetCollapseBackwardButton: function() {
  return this.GetCachedElement(this.postfixes.collapseBackwardButton);
 },
 GetCollapseForwardButton: function() {
  return this.GetCachedElement(this.postfixes.collapseForwardButton);
 },
 GetCollapseButtonsSeparator: function() {
  return this.GetCachedElement(this.postfixes.collapseButtonsSeparator);
 },
 GetCollapseButtonsTable: function() {
  return this.GetCachedValue("collapseButtonsTable", function(){
   return this.buttonsTableExists ? _aspxGetParentByTagName(this.GetCollapseForwardButton(), "TABLE") : null;
  });
 },
 GetCollapseButtonsSeparatorImage: function() {
  return this.GetCachedValue("collapseButtonsSeparatorImage", function(){
   var separator = this.GetCollapseButtonsSeparator();
   if(!separator) {
    if(!this.buttonsTableExists)
     separator = this.GetSeparatorElement();
    else
     return null;
   }
   return _aspxGetChildByTagName(separator, "IMG", 0);
  });
 },
 GetButtonUpdateElement: function(buttonElement) {
  return !this.pane.isVertical ? buttonElement.parentNode : buttonElement;
 },
 SetEmptyDivVisible: function(visible) {
  var emptyDiv = this.GetCachedValue("emptyDiv", function(){
   var emptyDiv = document.createElement("DIV");
   emptyDiv.style.cssText = "overflow: hidden; width: 0px; height: 0px";
   emptyDiv.isVisible = false;
   return emptyDiv;
  });
  if(visible != emptyDiv.isVisible) {
   if(visible)
    this.GetPaneElement().appendChild(emptyDiv);
   else 
    this.GetPaneElement().removeChild(emptyDiv);
   emptyDiv.isVisible = visible;
  }
 }
});
ASPxSplitterResizingPointer = _aspxCreateClass(null, {
 constructor: function(elementId) {
  this.elementId = elementId;
  this.element = _aspxGetElementById(this.elementId);
  this.x = 0;
  this.y = 0;
 },
 SetCursor: function(cursor) {
  this.element.style.cursor = cursor;
 },
 SetPosition: function(x, y) {
  this.x = x;
  this.y = y;
  _aspxSetAbsoluteY(this.element, this.y);
  _aspxSetAbsoluteX(this.element, this.x);
 },
 SetVisibility: function(isVisible) {
  _aspxSetElementDisplay(this.element, isVisible);
 },
 Move: function(delta, isX) {
  if(isX)
   this.x += delta;
  else
   this.y += delta;
  this.SetPosition(this.x, this.y);
 },
 AttachToElement: function(element, isShow) {
  _aspxSetStyleSize(this.element, element.offsetWidth, element.offsetHeight);
  this.SetVisibility(true);
  this.SetPosition(_aspxGetAbsoluteX(element), _aspxGetAbsoluteY(element));
 }
});
ASPxClientSplitter = _aspxCreateClass(ASPxClientControl, {
 constructor: function(name) {
  this.constructor.prototype.constructor.call(this, name);
  this.emptyUrls = [
   "javascript:false",
   "about:blank",
   "#"
  ];
  this.width = "100%";
  this.height = "200px";
  this.helper = new ASPxSplitterHelper(this);
  this.resizingPointer = new ASPxSplitterResizingPointer(this.name + "_RP");
  this.rootPane = new ASPxClientSplitterPane(this, null, 0, 0, {});
  this.liveResizing = false;
  this.allowResize = true;
  this.defaultMinSize = 5;
  this.showSeparatorImage = true;
  this.showCollapseBackwardButton = false;  
  this.showCollapseForwardButton = false;
  this.fullScreen = false;
  this.prepared = false;
  this.PaneResizing = new ASPxClientEvent();
  this.PaneResized = new ASPxClientEvent();
  this.PaneCollapsing = new ASPxClientEvent();
  this.PaneCollapsed = new ASPxClientEvent();
  this.PaneExpanding = new ASPxClientEvent();
  this.PaneExpanded = new ASPxClientEvent();
  this.PaneResizeCompleted = new ASPxClientEvent();
  this.PaneContentUrlLoaded = new ASPxClientEvent();
  this.isASPxClientSplitter = true;
 },
 CreatePanes: function(panesInfo) {
  this.ChangeEmptySizes(panesInfo);
  this.CreatePanesInternal(this.rootPane, panesInfo);
  this.state = this.GetStateObj(panesInfo);
 },
 ChangeEmptySizes: function(panesInfo) {
  var prcSum = 0;
  var emptyPanesCount = 0;
  for(var i = 0; i < panesInfo.length; i++) {
   var paneInfo = panesInfo[i];
   if(!paneInfo.st)
    emptyPanesCount++;
   else if(paneInfo.st == "%")
    prcSum += paneInfo.s;
  }
  var freePrcSize = 100 - prcSum;
  if((emptyPanesCount > 0) && (freePrcSize > 0)) {
   for(var i = 0; i < panesInfo.length; i++) {
    var paneInfo = panesInfo[i];
    if(!paneInfo.st) {
     paneInfo.st = "%";
     paneInfo.s = freePrcSize / emptyPanesCount;
    }
   }
  }
  for(var i = 0; i < panesInfo.length; i++) {
   if(panesInfo[i]["i"])
    this.ChangeEmptySizes(panesInfo[i]["i"]);
  }
 },
 CreatePanesInternal: function(parent, panesInfo) {
  var prevPane = null;
  var pane = null;
  var visibleIndex = 0;
  for(var i = 0; i < panesInfo.length; i++) {
   var paneInfo = panesInfo[i];
   if(paneInfo.v) {
    parent.panes.push(pane = new ASPxClientSplitterPane(this, parent, visibleIndex++, i, paneInfo));
    pane.prevPane = prevPane;
    if(prevPane != null)
     prevPane.nextPane = pane;
    prevPane = pane;
    if(_aspxIsExists(paneInfo["i"]))
     this.CreatePanesInternal(pane, paneInfo["i"]);
   }
  }
 },
 GetStateObj: function(panesInfo) {
  var result = [];
  for(var i = 0; i < panesInfo.length; i++) {
   var paneState = {};
   if(panesInfo[i].st) {
    paneState.st = panesInfo[i].st;
    paneState.s = panesInfo[i].s;
   }
   if(panesInfo[i].c)
    paneState.c = panesInfo[i].c;
   if(panesInfo[i]["i"])
    paneState["i"] = this.GetStateObj(panesInfo[i]["i"]);
   result.push(paneState);
  }
  return result;
 },
 GetClientStateString: function() {
  return _aspxToJson(this.GetClientStateObject());
 },
 GetClientStateObject: function() {
  return this.RefreshState(this.state, this.rootPane.panes);
 },
 RefreshState: function(state, panes) {
  for(var i = 0; i < panes.length; i++) {
   var pane = panes[i];
   var paneState = state[pane._index];
   paneState.s = Math.round(pane.size * 1000) / 1000;
   paneState.st = pane.sizeType;
   paneState.c = pane.collapsed ? 1 : 0;
   if(pane.panes.length == 0) {
    paneState.spt = pane.scrollTop;
    paneState.spl = pane.scrollLeft;
   }
   if(pane.panes.length > 0)
    this.RefreshState(paneState["i"], pane.panes);
  }
  return state;
 },
 InlineInitialize: function() {
  this.constructor.prototype.InlineInitialize.call(this);
  this.EnsureFullscreenMode();
  this.rootPane.ForEach("Initialize");
  var canEvaluateSizes = this.GetMainElement().offsetWidth > 0;
  if(canEvaluateSizes && this.IsDisplayed())
   this.AdjustControlCore();
 },
 EnsureFullscreenMode: function() {
  if(this.fullScreen) {
   var element = this.GetMainElement().parentNode;
   while(element && element.tagName) {
    element.style.height = "100%";
    var tagName = element.tagName.toLowerCase();
    if(tagName == "form" || tagName == "body" || tagName == "html") {
     element.style.margin = "0px";
     element.style.padding = "0px";
     element.style.overflow = "hidden";
    }
    if(tagName == "html")
     break;
    element = element.parentNode;
   }
  }
 },
 Initialize: function() {
  this.constructor.prototype.Initialize.call(this);
  this.rootPane.ForEach("CreateContentUrlIFrame", true);
 },
 AfterInitialize: function() {
  this.constructor.prototype.AfterInitialize.call(this);
  this.rootPane.ForEach("RaiseResizedEvent", true);
 },
 IsPrepared: function() {
  return this.prepared;
 },
 Prepare: function() {
  if(this.IsPrepared() || !this.IsDisplayed())
   return;
  this.rootPane.ForEach("Prepare", true);
  ASPxClientSplitter.instances[this.name] = this;
  this.prepared = true;
 },
 AdjustControlCore: function() {
  this.Prepare();
  this.UpdateControlSizes();
 },
 NeedUpdateControlSizes: function() {
  return this.width.indexOf("%") > -1
   || this.height.indexOf("%") > -1
   || !this.sizeUpdatedOnce;
 },
 UpdateControlSizes: function(forceUpdate) {
  if(!(forceUpdate || this.NeedUpdateControlSizes()) || !this.IsDisplayed())
   return;
  var element = this.GetMainElement();
  element.style.width = this.width;
  element.style.height = this.height;
  var focusedElement = _aspxGetFocusedElement(); 
  this.UpdatePanesVisible(_aspxChangeStyleAttribute);
  if(__aspxWebKitFamily) {
   var webkitSpecialElement = document.createElement("DIV");
   element.parentNode.appendChild(webkitSpecialElement);
   var offsetHeight = element.offsetHeight;
   element.parentNode.removeChild(webkitSpecialElement);
  }
  var newWidth = _aspxGetClearClientWidth(element);
  var newHeight = _aspxGetClearClientHeight(element);
  this.UpdatePanesVisible(_aspxRestoreStyleAttribute);
  if((this.rootPane.offsetWidth != newWidth) || (this.rootPane.offsetHeight != newHeight)) {
   this.rootPane.offsetWidth = newWidth;
   this.rootPane.offsetHeight = newHeight;
   this.rootPane.UpdatePanes();
  }
  try { 
   if(focusedElement &&  
    _aspxGetIsParent(element, focusedElement) && 
    !(focusedElement.tagName && focusedElement.tagName == "IFRAME")) { 
    focusedElement.blur();
    if(__aspxIE && __aspxBrowserVersion < 8 && focusedElement.tagName == "TD") {
     var childInput = _aspxGetChildByTagName(focusedElement, "INPUT", 0);
     if(childInput && _aspxElementIsVisible(childInput))
      focusedElement = childInput;
    }
    focusedElement.focus(); 
   }
  }
  catch(e) { }
  this.rootPane.ForEach("ApplyScrollPosition", true);
  this.rootPane.ForEach("AdjustControls", true);
  if(this.IsPrepared())
   this.sizeUpdatedOnce = true;
  this.SynchronizeProperties();
 },
 UpdatePanesVisible: function(func) {
  var firstTD = this.rootPane.panes[0].helper.GetPaneElement();
  func(firstTD, "width", "1px");
  func(firstTD, "height", "1px");
  func(this.rootPane.panes[0].helper.GetContentContainerElement(), "display", "none");
  for(var i = 1; i < this.rootPane.panes.length; i++) {
   var pane = this.rootPane.panes[i];
   func(pane.helper.GetPaneElement(), "display", "none");
   var separator = pane.helper.GetSeparatorElement();
   if (separator)
    func(separator, "display", "none");
  }
 },
 SynchronizeProperties: function() {
  var clientStateElement = this.helper.GetClientStateElement();
  if(clientStateElement) {
   var stateString = this.GetClientStateString();
   this.helper.GetClientStateElement().value = stateString;
   if(this.cookieName && this.cookieName != "") {
    _aspxDelCookie(this.cookieName);
    _aspxSetCookie(this.cookieName, stateString);
   }
  }
 },
 GetPaneByPath: function(panePath, parentPane) {
  var pane = parentPane || this.rootPane;
  for(var i = 0; i < panePath.length; i++)
   pane = pane.panes[panePath[i]];
  return pane;
 },
 GetPaneByStringPath: function(paneStringPath, paneIndexSeparator) {
  if(!paneIndexSeparator)
   paneIndexSeparator = __aspxItemIndexSeparator;
  return this.GetPaneByPath(paneStringPath.split(paneIndexSeparator));
 },
 OnWindowResize: function() {
  this.UpdateControlSizes();
 },
 OnSeparatorMouseDown: function(moveRightPanePath) {
  var pane = this.GetPaneByStringPath(moveRightPanePath);
  var invert = this.rtl && !pane.isVertical;
  this.moveRightPane = invert ? pane.prevPane : pane;
  this.moveLeftPane = invert ? pane : pane.prevPane;  
  this.moveIsVertical = pane.isVertical;
  this.moveStartPos = this.helper.GetCurrentPos();
  this.moveLastPos = this.moveStartPos;
  this.isHeavyUpdate = (this.moveLeftPane.isSizePx && !this.moveRightPane.isSizePx) ||
   (!this.moveLeftPane.isSizePx && this.moveRightPane.isSizePx);
  if(!this.moveLeftPane.IsAllowResize() || !this.moveRightPane.IsAllowResize())
   return false;
  if(this.moveLeftPane.collapsed || this.moveRightPane.collapsed)
   return false;
  if(this.RaiseCancelEvent("PaneResizing", this.moveRightPane) || this.RaiseCancelEvent("PaneResizing", this.moveLeftPane))
   return false;
  var cursor = this.moveIsVertical ? "n-resize" : "w-resize";
  if(!this.liveResizing) {
   this.resizingPointer.SetCursor(cursor);
   this.resizingPointer.AttachToElement(pane.helper.GetSeparatorElement(), true);
  }
  this.helper.SetResizingPanelVisibility(true, cursor);
  return true;
 },
 OnSeparatorMouseUp: function() {
  this.helper.SetResizingPanelVisibility(false);
  if(!this.liveResizing || !this.isHeavyUpdate) {
   var deltaSize = this.moveLastPos - this.moveStartPos;
   this.moveLeftPane.SetOffsetSize(this.moveLeftPane.GetOffsetSize() - deltaSize);
   this.moveRightPane.SetOffsetSize(this.moveRightPane.GetOffsetSize() + deltaSize);
   ASPxSplitterHelper.Resize(this.moveLeftPane, this.moveRightPane, deltaSize);
   this.moveLeftPane.parent.ForEach("UpdateChildrenSize");
  }
  if(!this.liveResizing)
   this.resizingPointer.SetVisibility(false);
  this.moveLeftPane.parent.ForEach("AdjustControls");
  this.SynchronizeProperties();
  this.RaiseEvent("PaneResizeCompleted", this.moveLeftPane);
  this.RaiseEvent("PaneResizeCompleted", this.moveRightPane);
 },
 OnMouseMove: function() { 
  var deltaSize = this.helper.GetMoveMaxDeltaSize(this.helper.GetCurrentPos() - this.moveLastPos);
  if(deltaSize == 0) return;
  this.moveLeftPane.SetOffsetSize(this.moveLeftPane.GetOffsetSize() + deltaSize);
  this.moveRightPane.SetOffsetSize(this.moveRightPane.GetOffsetSize() - deltaSize);
  if(this.liveResizing){
   var changePaneSize = function(pane, deltaSize) {
    pane.SetContentVisible(false);
    if(pane.ApplyElementSize()) {
    pane.ForEach("UpdateChildrenSize");
    pane.SetContentVisible(true);
     pane.RaiseResizedEvent();
    }
   };
   if(this.isHeavyUpdate) {
    ASPxSplitterHelper.Resize(this.moveLeftPane, this.moveRightPane, deltaSize);
    this.moveLeftPane.parent.ForEach("UpdateChildrenSize");
   }
   else {
    changePaneSize(this.moveLeftPane, deltaSize, this.helper);
    changePaneSize(this.moveRightPane, -deltaSize, this.helper);
   }
  }
  else
   this.resizingPointer.Move(deltaSize, !this.moveIsVertical);
  this.moveLastPos += deltaSize;
 },
 OnCollapseButtonClick: function(panePath, forwardDirection) {
  var rightPane = this.GetPaneByStringPath(panePath);
  var pane1 = forwardDirection ? rightPane.prevPane : rightPane;
  var pane2 = forwardDirection ? rightPane : rightPane.prevPane;
  if(pane1.collapsed && pane1.maximizedPane == pane2) {
   if(!this.RaiseCancelEvent("PaneExpanding", pane1))
    pane1.Expand();
  }
  else {
   if(!this.RaiseCancelEvent("PaneCollapsing", pane2))
    pane2.Collapse(pane1);
  }
 },
 IsEmptyUrl: function(url) {
  for(var i = 0; i < this.emptyUrls.length; i++)
   if(url == this.emptyUrls[i])
    return true;
  return false;
 },
 RaiseEvent: function(eventName, pane) {
  if(this.isInitialized)
   this[eventName].FireEvent(this, new ASPxClientSplitterPaneEventArgs(pane));
 },
 RaiseCancelEvent: function(eventName, pane) {
  var args = new ASPxClientSplitterPaneCancelEventArgs(pane);
  this[eventName].FireEvent(this, args);
  return args.cancel;
 },
 GetPaneCount: function() {
  return this.rootPane.GetPaneCount();
 },
 GetPane: function(index) {
  return this.rootPane.GetPane(index);
 },
 GetPaneByName: function(name) {
  return this.rootPane.GetPaneByName(name);
 },
 SetAllowResize: function(allowResize) {
  if(this.allowResize == allowResize)
   return;
  this.allowResize = allowResize;
  this.rootPane.ForEach("UpdateSeparatorStyle", true);
 },
 SetWidth: function(width) {
  this.width = width + "px";
  if(this.IsPrepared())
   this.UpdateControlSizes(true);
 },
 SetHeight: function(height) {
  this.height = height + "px";
  if(this.IsPrepared())
   this.UpdateControlSizes(true);
 }
});
ASPxClientSplitter.Cast = ASPxClientControl.Cast;
ASPxClientSplitterPane = _aspxCreateClass(null, {
 constructor: function(splitter, parent, visibleIndex, index, paneInfo) {
  this.splitter = splitter;
  this.parent = parent;
  this.index = visibleIndex;
  this._index = index;
  this.name = paneInfo.n || "";
  this.isRootPane = (this.parent == null);
  this.helper = new ASPxSplitterPaneHelper(this);
  this.prevPane = null;
  this.nextPane = null;
  this.panes = [];
  this.isVertical = this.isRootPane ? false : !parent.isVertical;
  this.hasSeparator = (this.index > 0);
  this.collapsed = _aspxIsExists(paneInfo.c);
  this.size = _aspxIsExists(paneInfo.s) ? paneInfo.s : 0;
  this.sizeType = _aspxIsExists(paneInfo.st) ? paneInfo.st : null;
  this.maxSize = _aspxIsExists(paneInfo.smax) ? paneInfo.smax : Number.MAX_VALUE;
  this.minSize = _aspxIsExists(paneInfo.smin) ? paneInfo.smin : this.splitter.defaultMinSize;
  this.allowResize = !_aspxIsExists(paneInfo.nar);
  this.showCollapseBackwardButton = _aspxIsExists(paneInfo.scbb);
  this.showCollapseForwardButton = _aspxIsExists(paneInfo.scfb);
  this.iframe = {};
  if(paneInfo.iframe) {
   this.iframe = {
    src: paneInfo.iframe[0],
    scrolling: paneInfo.iframe[1]
   };
   if(paneInfo.iframe[2] != "")
    this.iframe.name = paneInfo.iframe[2];
   if(paneInfo.iframe[3] != "")
    this.iframe.title = paneInfo.iframe[3];
   this.isContentUrl = true;
  }
  this.scrollTop = paneInfo.spt || 0;
  this.scrollLeft = paneInfo.spl || 0;
  this.isSizePx = (this.sizeType == "px");
  this.maximizedPane = null;
  this.dragPrevented = false;
  this.offsetWidth = 0;
  this.offsetHeight = 0;
  this.widthDiff = 0;
  this.heightDiff = 0;
  this.minimizedWidthDiff = 0;
  this.minimizedHeightDiff = 0;
  this.contentContainerWidthDiff = 0;
  this.contentContainerHeightDiff = 0;
  this.isASPxClientSplitterPane = true;
 },
 Initialize: function() {
  this.InitializePreventDragging();
  if(this.isRootPane)
   return;
  if(this.collapsed) {
   if(this.IsFirstPane())
    this.maximizedPane = this.parent.panes[1];
   else if (this.prevPane.maximizedPane != this)
    this.maximizedPane = this.prevPane;
   else
    this.maximizedPane = this.nextPane;
   if (this.maximizedPane == null)
    this.collapsed = false;
  }
 },
 Prepare: function() {
  var EvaluateWidthDiff = function(element) {
   return element.offsetWidth - element.clientWidth;
  };
  var EvaluateHeightDiff = function(element) {
   var elementClientHeight = ((__aspxSafari && (__aspxBrowserVersion < 4)) || (__aspxChrome && (__aspxBrowserVersion < 2))) ? (element.offsetHeight - element.clientTop * 2) : element.clientHeight;
   return element.offsetHeight - elementClientHeight;
  };
  this.GetSeparatorSize();
  var element = this.helper.GetPaneElement();
  if(__aspxIE && __aspxBrowserMajorVersion == 9) { 
   var b203253_TestWidth = EvaluateWidthDiff(element);
   if(b203253_TestWidth > 10000) { 
    _aspxChangeStyleAttribute(document.body, "width", "1px");
    var b203253_BodyWidthChanged = true;
   }
  }
  this.widthDiff = EvaluateWidthDiff(element);
  this.heightDiff = EvaluateHeightDiff(element);
  if(this.panes.length == 0) {
    var contentContainerElement = this.helper.GetContentContainerElement();
   _aspxSetScrollBarVisibility(contentContainerElement, false);
   _aspxSetStyleSize(contentContainerElement, 1, 1);
   if(__aspxIE && __aspxBrowserMajorVersion < 7) 
    contentContainerElement.style.overflow = "hidden";
   this.contentContainerWidthDiff = contentContainerElement.offsetWidth - 1;
   this.contentContainerHeightDiff = contentContainerElement.offsetHeight - 1;
   _aspxSetScrollBarVisibility(contentContainerElement, true);
   if(!this.scrollEventAttached) {
    var _this = this;
    _aspxAttachEventToElement(contentContainerElement, "scroll", function() {
     if(contentContainerElement.scrollTop >= 0)
      _this.scrollTop = contentContainerElement.scrollTop;
     if(contentContainerElement.scrollLeft >= 0)
      _this.scrollLeft = contentContainerElement.scrollLeft;
     _this.splitter.SynchronizeProperties();
    });
    this.scrollEventAttached = true;
   }
  }
  this.UpdateStyle(element, true);
  this.collapsedWidthDiff = EvaluateWidthDiff(element);
  this.collapsedHeightDiff = EvaluateHeightDiff(element);
  this.UpdateStyle(element, false);
  if(__aspxIE && __aspxBrowserMajorVersion == 9 && b203253_BodyWidthChanged) 
   _aspxRestoreStyleAttribute(document.body, "width");
  var separator = this.helper.GetSeparatorElement();
  if(separator) {
   _aspxSetElementDisplay(this.helper.GetSeparatorDivElement(), false);
   if(!this.isVertical)
    this.separatorSizeDiff = separator.offsetWidth - separator.clientWidth;
   else
    this.separatorSizeDiff = separator.offsetHeight - separator.clientHeight;
   _aspxSetElementDisplay(this.helper.GetSeparatorDivElement(), true);
  }
  else
   this.separatorSizeDiff = 0;
  this.PrepareSeparatorButtons();
 },
 PrepareSeparatorButtons: function() {
  if(!(this.hasSeparator && this.helper.buttonsExists))
   return;
  var sizeProperty = this.isVertical ? "offsetWidth" : "offsetHeight";
  if(this.helper.buttonsTableExists) {
   this.collapseBackwardButtonSize = this.helper.GetButtonUpdateElement(this.helper.GetCollapseBackwardButton())[sizeProperty];
   this.collapseForwardButtonSize = this.helper.GetButtonUpdateElement(this.helper.GetCollapseForwardButton())[sizeProperty];
   this.buttonsTableDiffSize = this.helper.GetCollapseButtonsTable()[sizeProperty] - this.collapseBackwardButtonSize - this.collapseForwardButtonSize;
   if(this.helper.separatorImageExists) {
    this.collapseButtonsSeparatorSize = this.helper.GetButtonUpdateElement(this.helper.GetCollapseButtonsSeparator())[sizeProperty];
    this.buttonsTableDiffSize -= this.collapseButtonsSeparatorSize;
   }
  }
  else
   this.collapseButtonsSeparatorSize = this.helper.GetCollapseButtonsSeparatorImage()[sizeProperty];
 },
 InitializePreventDragging: function() {
  if(!this.dragPrevented && this.helper.separatorImageExists) {
   _aspxPreventElementDrag(this.helper.GetCollapseButtonsSeparatorImage());
   this.dragPrevented = true;
  }
 },
 ApplyScrollPosition: function() {
  if(this.panes.length == 0) {
   var element = this.helper.GetContentContainerElement();
   if(__aspxIE && __aspxBrowserMajorVersion < 8) {
    var _this = this;
    window.setTimeout(function() {
     element.scrollTop = _this.scrollTop;
     element.scrollLeft = _this.scrollLeft;
    }, 0);
   }
   else {
    element.scrollTop = this.scrollTop;
    element.scrollLeft = this.scrollLeft;
   }
  }
 },
 ForEach: function(funcName, skippSelf) {
  if(!skippSelf)
   this[funcName]();
  for(var i = 0; i < this.panes.length; i++)
   this.panes[i].ForEach(funcName);
 },
 SetContentVisible: function(visible) {
  _aspxSetElementDisplay(this.helper.GetContentContainerElement(), visible);
  if(__aspxIE)
   this.helper.SetEmptyDivVisible(!visible);
 },
 AdjustControls: function() {
  if(this.panes.length == 0 && !this.collapsed && !this.isContentUrl)
   aspxGetControlCollection().AdjustControls(this.helper.GetContentContainerElement(), false);
 },
 UpdatePanes: function() {
  this.ForEach("UpdateChildrenSize");
  this.ForEach("UpdateVisualElements", true);
 },
 UpdateVisualElements: function() {
  this.UpdateButtonsVisibility();
  this.UpdateSeparatorStyle();
  this.UpdatePaneStyle();
 },
 IsBackwardButtonVisible: function() {
  return ASPxCacheHelper.GetCachedValue(this, "isBackwardButtonVisible", function() {
   if(!this.helper.buttonsTableExists)
    return false;
   if(this.collapsed && (this.maximizedPane == this.prevPane))
    return true;
   if(this.prevPane.collapsed)
    return false;
   return this.showCollapseBackwardButton;
  }, this.helper);
 },
 IsForwardButtonVisible: function() {
  return ASPxCacheHelper.GetCachedValue(this, "isForwardButtonVisible", function(){
   if(!this.helper.buttonsTableExists)
    return false;
   if(this.prevPane.collapsed && (this.prevPane.maximizedPane == this))
    return true;
   if(this.collapsed)
    return false;
   return this.showCollapseForwardButton;
  }, this.helper);
 },
 DropCachedButtonsVisible: function() {
  ASPxCacheHelper.DropCachedValue(this.helper, "isBackwardButtonVisible");
  ASPxCacheHelper.DropCachedValue(this.helper, "isForwardButtonVisible");
 },
 IsAllowResize: function() {
  return this.allowResize && this.splitter.allowResize;
 },
 UpdateSeparatorStyle: function() {
  var separator = this.helper.GetSeparatorElement();
  if(!separator) return;
  var prevPaneCollapsed = this.prevPane != null && this.prevPane.collapsed;
  var prevPaneAllowResize = this.prevPane != null && this.prevPane.IsAllowResize();
  var isCollapsed = this.collapsed || prevPaneCollapsed;
  var resizingEnabled = this.IsAllowResize() && prevPaneAllowResize;
  aspxGetStateController().SetMouseStateItemsEnabled(this.helper.GetSeparatorElementId(), null, !isCollapsed && resizingEnabled);
  this.UpdateStyle(separator, isCollapsed);
 },
 UpdatePaneStyle: function() {
  this.UpdateStyle(this.helper.GetPaneElement(), this.collapsed);
 },
 UpdateStyle: function(element, isSelect) {
  if(isSelect)
   aspxGetStateController().SelectElementBySrcElement(element);
  else
   aspxGetStateController().DeselectElementBySrcElement(element);
 },
 UpdateButtonsVisibility: function() {
  if(!(this.hasSeparator && this.helper.buttonsExists))
   return;
  var separatorSize = this.GetOffsetSize(!this.isVertical) - this.separatorSizeDiff;
  if(this.helper.buttonsTableExists) {
   var buttonsSize = this.buttonsTableDiffSize;
   if(this.IsBackwardButtonVisible())
    buttonsSize += this.collapseBackwardButtonSize;
   if(this.IsForwardButtonVisible())
    buttonsSize += this.collapseForwardButtonSize;
   var buttonsVisible = (buttonsSize <= separatorSize);
   var backwardButtonVisible = buttonsVisible && this.IsBackwardButtonVisible();
   var forwardButtonVisible = buttonsVisible && this.IsForwardButtonVisible();
   _aspxSetElementDisplay(this.helper.GetButtonUpdateElement(this.helper.GetCollapseBackwardButton()), backwardButtonVisible);
   _aspxSetElementDisplay(this.helper.GetButtonUpdateElement(this.helper.GetCollapseForwardButton()), forwardButtonVisible);
   if(this.helper.separatorImageExists) {
    if(!buttonsVisible)
     buttonsSize = this.buttonsTableDiffSize;
    buttonsSize += this.collapseButtonsSeparatorSize;
    var separatorImageVisible = this.splitter.showSeparatorImage && (backwardButtonVisible === forwardButtonVisible) && (buttonsSize <= separatorSize);
    _aspxSetElementDisplay(this.helper.GetButtonUpdateElement(this.helper.GetCollapseButtonsSeparator()), separatorImageVisible);
   }
  }
  else {
   var separatorImageVisible = this.splitter.showSeparatorImage && (this.collapseButtonsSeparatorSize <= separatorSize);
   _aspxSetElementDisplay(this.helper.GetCollapseButtonsSeparatorImage(), separatorImageVisible);
  }
 },
 GetSeparatorSize: function() {
  return ASPxCacheHelper.GetCachedValue(this, "SeparatorSize", function() {
   var separator = this.helper.GetSeparatorElement();
   return separator ? (this.isVertical ? separator.offsetHeight : separator.offsetWidth) : 0;
  }, this.helper);
 }, 
 GetTotalSeparatorsSize: function(isVertical) {
  if(!_aspxIsExists(isVertical) || (isVertical == this.isVertical))
   return 0;
  var cacheKey = (isVertical ? "v" : "h") + "TotalSeparatorsSize"; 
  return ASPxCacheHelper.GetCachedValue(this, cacheKey, function() {
   var result = 0;
   for(var i = 0; i < this.panes.length; i++)
    result += this.panes[i].GetSeparatorSize();
   return result;
  }, this.helper);
 },
 GetMinSize: function(isVertical) {
  if(!_aspxIsExists(isVertical))
   isVertical = this.isVertical;
  var cacheKey = (isVertical ? "v" : "h") + "ItemMinSize";
  return ASPxCacheHelper.GetCachedValue(this, cacheKey, function() {
   var result = 0;
   for(var i = 0; i < this.panes.length; i++)
    if(isVertical != this.isVertical)
     result += this.panes[i].GetMinSize(isVertical);
    else
     result = Math.max(result, this.panes[i].GetMinSize(isVertical));
   result += this.GetTotalSeparatorsSize(isVertical);
   var minSize = (isVertical == this.isVertical) ? this.minSize : this.splitter.defaultMinSize;
   result = Math.max(result, Math.max(minSize, this.GetSizeDiff(isVertical)));
   return result;
  }, this.helper);
 },
 DropCachedSizes: function() {
  ASPxCacheHelper.DropCachedValue(this.helper, "SeparatorSize");
  ASPxCacheHelper.DropCachedValue(this.helper, "vTotalSeparatorsSize");
  ASPxCacheHelper.DropCachedValue(this.helper, "hTotalSeparatorsSize");
  ASPxCacheHelper.DropCachedValue(this.helper, "ItemMinSize");
 },
 GetMaxSize: function() {
  return Math.max(this.maxSize, this.GetSizeDiff(this.isVertical));
 },
 PrepareUpdateInfo: function() {
  var updateInfo = {};
  var prepareUpdateInfoPart = function() {
   return {
    panes: [],
    sum: 0,
    sumMin: 0,
    sumMax: 0,
    addPane: function() {
     this.panes.push(pane);
     if(pane.collapsed) {
      var sizeDiff = pane.GetSizeDiff(pane.isVertical);
      this.sum += sizeDiff;
      this.sumMin += sizeDiff;
     }
     else {
      this.sum += pane.size;
      this.sumMin += pane.GetMinSize();
     }
     this.sumMax += pane.GetMaxSize();
    },
    IsIgnoreMaxSize: function() {
     return this.sumMax < this.sum;
    }
   };
  };
  updateInfo.px = prepareUpdateInfoPart();
  updateInfo.prc = prepareUpdateInfoPart();
  updateInfo.collapsed = prepareUpdateInfoPart();
  updateInfo.onlyPxPanes = true; 
  updateInfo.hasPxPanesShown = false;
  updateInfo.hasPrcPanesShown = false;
  for(var i = 0; i < this.panes.length; i++) {
   var pane = this.panes[i];
   if(pane.collapsed)
    updateInfo.collapsed.addPane(pane);
   else if(pane.isSizePx) {
    updateInfo.px.addPane(pane);
    updateInfo.hasPxPanesShown = true;
   }
   else {
    updateInfo.prc.addPane(pane);
    updateInfo.hasPrcPanesShown = true;
   }
   if(!pane.isSizePx)
    updateInfo.onlyPxPanes = false;
  }
  updateInfo.px.isIgnoreMaxSize = (!updateInfo.hasPrcPanesShown && (updateInfo.px.sumMax < updateInfo.px.sum));
  updateInfo.prc.isIgnoreMaxSize = (updateInfo.prc.sumMax < updateInfo.prc.sum);
  return updateInfo;
 },
 SetChildrenSecondSize: function() {
  var orientation = this.isVertical;
  var size = this.GetClientSize(orientation);
  for(var i = 0; i < this.panes.length; i++)
   this.panes[i].SetOffsetSize(size, orientation);
 },
 GetChildrenTotalSize: function() {
  return this.GetClientSize(!this.isVertical) - this.GetTotalSeparatorsSize(!this.isVertical);
 },
 UpdateChildrenSize: function() {
  if(this.collapsed || (this.panes.length == 0))
   return;
  var updateInfo = this.PrepareUpdateInfo();
  var childrenTotalSize = this.GetChildrenTotalSize();
  var pxMaxSize = childrenTotalSize - (updateInfo.prc.sumMin + updateInfo.collapsed.sumMin);
  var pxTotalSize = 0;
  if((pxMaxSize > 0) && updateInfo.hasPxPanesShown) {
   var c = !updateInfo.hasPrcPanesShown ? (pxMaxSize / updateInfo.px.sum) : 1;
   for(var i = 0; i < updateInfo.px.panes.length; i++) {
    var pane = updateInfo.px.panes[i];
    var newSize = Math.max(Math.round(pane.size * c), pane.GetMinSize());
    if(!updateInfo.px.isIgnoreMaxSize)
     newSize = Math.min(newSize, pane.GetMaxSize());
    pane.SetOffsetSize(newSize);
    pxTotalSize += newSize;
   }
   if(!updateInfo.hasPrcPanesShown || (pxTotalSize > pxMaxSize))
    pxTotalSize = this.NormalizePanesSizes(updateInfo.px.panes, pxTotalSize, pxMaxSize);
   if (updateInfo.onlyPxPanes) {
    for(var i = 0; i < updateInfo.px.panes.length; i++) {
     var pane = updateInfo.px.panes[i];
     pane.size = pane.GetOffsetSize();
    }
   }
  }
  var prcMaxSize = pxMaxSize - pxTotalSize + updateInfo.prc.sumMin;
  var prcTotalSize = 0;
  if((prcMaxSize > 0) && updateInfo.hasPrcPanesShown) {
   var c = 1 / updateInfo.prc.sum;
   for(var i = 0; i < updateInfo.prc.panes.length; i++) {
    var pane = updateInfo.prc.panes[i];
    var newSize = Math.max(Math.round(pane.size * c * (childrenTotalSize - pxTotalSize)), pane.GetMinSize());
    if(!updateInfo.prc.isIgnoreMaxSize)
     newSize = Math.min(newSize, pane.GetMaxSize());
    pane.SetOffsetSize(newSize);
    prcTotalSize += newSize;
   }
   if(prcTotalSize != prcMaxSize)
    prcTotalSize = this.NormalizePanesSizes(updateInfo.prc.panes, prcTotalSize, prcMaxSize);
  }
  for(var i = 0; i < updateInfo.collapsed.panes.length; i++) {
   var pane = updateInfo.collapsed.panes[i];
   pane.SetOffsetSize(pane.GetSizeDiff(pane.isVertical));
  }
  this.SetChildrenSecondSize();
  for(var i = 0; i < this.panes.length; i++) {
   var pane = this.panes[i];
   if(pane.collapsed)
    pane.SetContentVisible(false);
   else
    pane.SetContentVisible(true);
   if(pane.ApplyElementSize())
    pane.RaiseResizedEvent();
  }
  this.ForEach("UpdateButtonsVisibility", true);
 },
 GetPossibleUp: function() {
  return this.GetMaxSize() - this.GetOffsetSize();
 },
 GetPossibleDown: function() {
  return this.GetOffsetSize() - this.GetMinSize();
 },
 NormalizePanesSizes: function(panes, size, maxSize) {
  var insufficientSize = maxSize - size;
  var changeStep = (insufficientSize > 0) ? 1 : -1;
  var possibleChangeFunction = (insufficientSize > 0) ? "GetPossibleUp" : "GetPossibleDown";
  var changed = true;
  while((insufficientSize != 0) && changed) {
   changed = false;
  for(var i = 0; i < panes.length; i++) {
   var pane = panes[i];
    if(pane[possibleChangeFunction]() > 0) {
     pane.SetOffsetSize(pane.GetOffsetSize() + changeStep);
     insufficientSize -= changeStep;
     changed = true;
     if(insufficientSize == 0)
      break;
  }
   }
  }
  return maxSize - insufficientSize;
 },
 GetOffsetSize: function(isVertical) {
  if(!_aspxIsExists(isVertical))
   isVertical = this.isVertical;
  return isVertical ? this.offsetHeight : this.offsetWidth;
 },
 GetClientSize: function(isVertical) {
  return isVertical ? this.GetClientHeightInternal(true) : this.GetClientWidthInternal(true);
 },
 SetOffsetSize: function(value, isVertical) {
  if(!_aspxIsExists(isVertical))
   isVertical = this.isVertical;
  if(isVertical)
   this.offsetHeight = value;
  else
   this.offsetWidth = value;
 },
 GetSizeDiff: function(isVertical) {
  return isVertical ? this.GetHeightDiff(true) : this.GetWidthDiff(true);
 },
 GetWidthDiff: function(isContainer) {
  if(this.collapsed)
   return this.collapsedWidthDiff;
  return this.widthDiff + (isContainer ? this.contentContainerWidthDiff : 0);
 },
 GetHeightDiff: function(isContainer) {
  if(this.collapsed)
   return this.collapsedHeightDiff;
  return this.heightDiff + (isContainer ? this.contentContainerHeightDiff : 0);
 },
 GetClientWidthInternal: function(isContainer) {
  return this.offsetWidth - this.GetWidthDiff(isContainer);
 },
 GetClientHeightInternal: function(isContainer) {
  return this.offsetHeight - this.GetHeightDiff(isContainer);
 },
 ApplyElementSize: function() {
  if(this.IsSizeChanged()) {
   this.ApplyElementSizeCore();
   var contentContainerElement = this.helper.GetContentContainerElement();
   if(__aspxChrome && __aspxBrowserMajorVersion >= 3
     || __aspxSafari && __aspxBrowserMajorVersion >= 5) {
    var marginRight = _aspxPxToInt(contentContainerElement.style.marginRight);
    marginRight -= _aspxPxToInt(_aspxGetCurrentStyle(contentContainerElement).marginRight);
    contentContainerElement.style.marginRight = marginRight + "px";
   }
   if(__aspxWebKitFamily) {
    var updated = _aspxSetScrollBarVisibilityCore(contentContainerElement, "overflowY", this.GetClientWidthInternal(true) > _aspxGetVerticalScrollBarWidth());
    if(updated && this.isContentUrl)
     this.RefreshContentUrl();
   }
   return true;
  }
  return false;
 },
 ApplyElementSizeCore: function() {
  var paneWidth = this.GetClientWidthInternal(false);
  var paneHeight = this.GetClientHeightInternal(false);
  var contentContainerWidth = this.GetClientWidthInternal(true);
  var contentContainerHeight = this.GetClientHeightInternal(true);
  if(contentContainerWidth < 0) {
   paneWidth -= contentContainerWidth;
   contentContainerWidth = 0;
  }
  if(contentContainerHeight < 0) {
   paneHeight -= contentContainerHeight;
   contentContainerHeight = 0;
  }
  _aspxSetStyleSize(this.helper.GetPaneElement(), paneWidth, paneHeight);
  var contentContainerElement = this.helper.GetContentContainerElement();
  _aspxSetStyleSize(contentContainerElement, contentContainerWidth, contentContainerHeight);
 },
 IsSizeChanged: function() {
  if(!_aspxIsExists(this.lastWidth) || !_aspxIsExists(this.lastHeight) ||
   (this.offsetWidth != this.lastWidth) || (this.offsetHeight != this.lastHeight)) {
   this.lastWidth = this.offsetWidth;
   this.lastHeight = this.offsetHeight;
   return true;
  }
  return false;
 },
 GetSplitter: function() {
  return this.splitter;
 },
 GetParentPane: function() {
  return this.parent;
 },
 GetPrevPane: function() {
  return this.prevPane;
 },
 GetNextPane: function() {
  return this.nextPane;
 },
 IsFirstPane: function() {
  return (this.prevPane == null);
 },
 IsLastPane: function() {
  return (this.nextPane == null);
 },
 IsVertical: function() {
  return this.isVertical;
 },
 GetPaneCount: function() {
  return this.panes.length;
 },
 GetPane: function(index) {
  return (0 <= index && index < this.panes.length) ? this.panes[index] : null;
 },
 GetPaneByName: function(name) {
  for(var i = 0; i < this.panes.length; i++)
   if(this.panes[i].name == name) return this.panes[i];
  for(var i = 0; i < this.panes.length; i++) {
   var pane = this.panes[i].GetPaneByName(name);
   if(pane != null) return pane;
  }
  return null;
 },
 GetClientWidth: function() {
  var clientWidth = this.GetClientWidthInternal(true);
  if(!this.IsContentUrlPane()){
   var contentContainer = this.helper.GetContentContainerElement();
   if((contentContainer.style.overflow == "auto" && contentContainer.scrollHeight > contentContainer.clientHeight) 
     || contentContainer.style.overflow == "scroll"
     || contentContainer.style.overflowY == "scroll"){
    clientWidth = clientWidth - _aspxGetVerticalScrollBarWidth();
   }
  }
  return clientWidth;
 },
 GetClientHeight: function() {
  return this.GetClientHeightInternal(true);
 },
 Collapse: function(maximizedPane) {
  if(!this.splitter.IsPrepared())
   return false;
  if(this.collapsed)
   return false;
  if(!_aspxIsExists(maximizedPane) || !maximizedPane.isASPxClientSplitterPane)
   return false;
  return this.CollapseExpandCore(true, maximizedPane, "PaneCollapsed");
 },
 CollapseForward: function() {
  return this.Collapse(this.nextPane);
 },
 CollapseBackward: function() {
  return this.Collapse(this.prevPane);
 },
 Expand: function() {
  if(!this.splitter.IsPrepared())
   return false;
  if(!this.collapsed)
   return false;
  return this.CollapseExpandCore(false, null, "PaneExpanded");
 },
 CollapseExpandCore: function(collapsed, maximizedPane, eventName) {
  this.collapsed = collapsed;
  this.maximizedPane = maximizedPane;
  this.DropCachedButtonsVisible();
  if(this.nextPane != null)
   this.nextPane.DropCachedButtonsVisible();
  this.GetParentPane().UpdatePanes();
  this.GetParentPane().ForEach("AdjustControls");
  this.splitter.RaiseEvent(eventName, this);
  this.splitter.SynchronizeProperties();
  return true;
 },
 IsCollapsed: function() {
  return this.collapsed;
 },
 IsContentUrlPane: function() {
  return this.isContentUrl;
 },
 GetContentUrl: function() {
  return this.isContentUrl
   ? this.iframeObj.GetContentUrl()
   : "";
 },
 SetContentUrl: function(url, preventBrowserCaching) {
  if(!this.isContentUrl)
   return;
  this.iframeObj.SetContentUrl(url, preventBrowserCaching);
 },
 RefreshContentUrl: function() {
  if(!this.isContentUrl)
   return;
  this.iframeObj.RefreshContentUrl();
 },
 GetContentIFrame: function() {
  return this.isContentUrl
   ? this.helper.GetContentContainerElement()
   : null;
 },
 CreateContentUrlIFrame: function() {
  if(!this.isContentUrl)
   return;
  var contentContainer = this.helper.GetContentContainerElement();
  contentContainer.parentNode.removeChild(contentContainer);
  var instance = this;
  this.iframeObj = new ASPxIFrame({
   id: contentContainer.id,
   name: this.iframe.name,
   title: this.iframe.title,
   scrolling: this.iframe.scrolling,
   src: this.iframe.src,
   onCreate: function(containerElement, element) {
    instance.helper.GetPaneElement().appendChild(containerElement);
    instance.helper.DropContentContainerElementFromCache();
    instance.ApplyElementSizeCore();
   },
   onLoad: function() {
    instance.splitter.RaiseEvent("PaneContentUrlLoaded", instance);
   }
  });
 },
 SetAllowResize: function(allowResize) {
  this.allowResize = allowResize;
  this.UpdateSeparatorStyle();
  if(!this.IsLastPane())
   this.nextPane.UpdateSeparatorStyle();
 },
 RaiseResizedEvent: function() {
  this.splitter.RaiseEvent("PaneResized", this);
 },
 GetElement: function() {
  return this.helper.GetPaneElement();
 },
 SetSize: function(size) {
  if(!this.splitter.IsPrepared())
   return;
  if(this.SetSizeCore(size)) {
   this.parent.ForEach("UpdateChildrenSize");
   this.parent.ForEach("AdjustControls");
   this.splitter.SynchronizeProperties();
  }
 },
 GetSize: function() {
  return this.size + this.sizeType;
 },
 SetSizeCore: function(size) {
  if(!_aspxIsExists(size))
   return false;
  if(typeof(size) == "string") {
   var parsedSize = parseInt(size);
   if(isNaN(parsedSize))
    return false;
   this.size = parsedSize;
   this.sizeType = (size.indexOf("%") > -1) ? "%" : "px";
  }
  else if(typeof(size) == "number") {
   this.size = size;
   this.sizeType = "px";
  }
  else
   return false;
  this.isSizePx = this.sizeType == "px";
  return true;
 }
});
ASPxClientSplitter.instances = {};
ASPxClientSplitter.GetInstance = function(name) {
 var instance = ASPxClientSplitter.instances[name];
 if(instance) {
  if(instance.GetMainElement())
   return instance;
  delete ASPxClientSplitter.instances[name]; 
 }
 return null;
};
ASPxClientSplitter.timerInterval = 0;
ASPxClientSplitter.GetRegEx = function(idPostfix) {
 if(!this.regExs)
  this.regExs = {};
 if(!this.regExs[idPostfix])
  this.regExs[idPostfix] = "_\\d+(" + __aspxItemIndexSeparator + "\\d+)*_" + idPostfix + "$";
 return this.regExs[idPostfix];
};
ASPxClientSplitter.IsActualWindowResize = function() {
 var width = _aspxGetDocumentClientWidth();
 var height = _aspxGetDocumentClientHeight();
 if(width != ASPxClientSplitter.lastWindowResizeWidth || height != ASPxClientSplitter.lastWindowResizeHeight) {
  ASPxClientSplitter.lastWindowResizeWidth = width;
  ASPxClientSplitter.lastWindowResizeHeight = height;
  return true;
 }
 return false;
};
ASPxClientSplitter.SuspendedWindowResizeCore = function() {
 for(var name in ASPxClientSplitter.instances) {
  var instance = ASPxClientSplitter.GetInstance(name);
  if(instance)
   instance.OnWindowResize();
 }
};
ASPxClientSplitter.mainWindowResizeTimeout = -1;
ASPxClientSplitter.additionalWindowResizeTimeout = -1;
ASPxClientSplitter.MainSuspendedWindowResize = function() {
 ASPxClientSplitter.SuspendedWindowResizeCore();
 ASPxClientSplitter.mainWindowResizeTimeout = _aspxClearTimer(ASPxClientSplitter.mainWindowResizeTimeout);
};
ASPxClientSplitter.AdditionalSuspendedWindowResize = function() {
 ASPxClientSplitter.SuspendedWindowResizeCore();
 ASPxClientSplitter.additionalWindowResizeTimeout = _aspxClearTimer(ASPxClientSplitter.additionalWindowResizeTimeout);
};
ASPxClientSplitter.OnWindowResize = function() {
 if(!ASPxClientSplitter.IsActualWindowResize())
  return;
 if(ASPxClientSplitter.additionalWindowResizeTimeout != -1)
  ASPxClientSplitter.additionalWindowResizeTimeout = _aspxClearTimer(ASPxClientSplitter.additionalWindowResizeTimeout);
 if(ASPxClientSplitter.mainWindowResizeTimeout == -1)
  ASPxClientSplitter.mainWindowResizeTimeout = _aspxSetTimeout(ASPxClientSplitter.MainSuspendedWindowResize, ASPxClientSplitter.timerInterval);
 else
  ASPxClientSplitter.additionalWindowResizeTimeout = _aspxSetTimeout(ASPxClientSplitter.AdditionalSuspendedWindowResize, 100);
};
ASPxClientSplitter.SaveCurrentPos = function(evt) {
 evt = _aspxGetEvent(evt);
 ASPxClientSplitter.CurrentXPos = _aspxGetEventX(evt);
 ASPxClientSplitter.CurrentYPos = _aspxGetEventY(evt);
};
ASPxClientSplitter.FindParentCell = function(element) {
 if(element.tagName != "TD") 
  element = _aspxGetParentByTagName(element, "TD");
 return element;
};
ASPxClientSplitter.FindSplitterInfo = function(evt, regex, suffixLength) {
 var element = ASPxClientSplitter.FindParentCell(_aspxGetEventSource(evt));
 if(element) {
  var matchResult = element.id.match(regex);
  if(matchResult) {
   var name = element.id.substring(0, matchResult.index);
   var splitter = ASPxClientSplitter.GetInstance(name);
   if(splitter != null) {
    var panePath = element.id.substring(matchResult.index + 1, element.id.length - suffixLength);
    return { "splitter" : splitter, "panePath" : panePath };
   }
  }  
 }
 return null;
};
ASPxClientSplitter.OnMouseClick = function(evt) {
 var info = ASPxClientSplitter.FindSplitterInfo(evt, ASPxClientSplitter.GetRegEx("S_CF"), 5);
 if(info)
  info.splitter.OnCollapseButtonClick(info.panePath, true);
 else {
  info = ASPxClientSplitter.FindSplitterInfo(evt, ASPxClientSplitter.GetRegEx("S_CB"), 5);
  if(info)
   info.splitter.OnCollapseButtonClick(info.panePath, false);
 } 
};
ASPxClientSplitter.OnMouseDown = function(evt) {
 var info = ASPxClientSplitter.FindSplitterInfo(evt, ASPxClientSplitter.GetRegEx("S"), 2);
 if(!info) 
  info = ASPxClientSplitter.FindSplitterInfo(evt, ASPxClientSplitter.GetRegEx("S_CS"), 5);
 if(info && info.splitter) {
  _aspxSetElementSelectionEnabled(document.body, false);
  ASPxClientSplitter.current = info.splitter;
  ASPxClientSplitter.SaveCurrentPos(evt);
  ASPxClientSplitter.isInMove = info.splitter.OnSeparatorMouseDown(info.panePath);
 }
};
ASPxClientSplitter.OnMouseUp = function() {
 if(ASPxClientSplitter.isInMove) {
  ASPxClientSplitter.isInMove = false;
  _aspxSetElementSelectionEnabled(document.body, true);
  ASPxClientSplitter.current.OnSeparatorMouseUp();
 }
};
ASPxClientSplitter.mouseMoveTimeoutId = -1;
ASPxClientSplitter.SuspendedMouseMove = function() {
 if(ASPxClientSplitter.isInMove)
  ASPxClientSplitter.current.OnMouseMove();
 ASPxClientSplitter.mouseMoveTimeoutId = _aspxClearTimer(ASPxClientSplitter.mouseMoveTimeoutId);
};
ASPxClientSplitter.OnMouseMove = function(evt) {
 if(!ASPxClientSplitter.isInMove)
  return;
 if(__aspxIE && !_aspxGetIsLeftButtonPressed(evt)) {
  ASPxClientSplitter.OnMouseUp(evt);
  return;
 }
 ASPxClientSplitter.SaveCurrentPos(evt);
 if(ASPxClientSplitter.mouseMoveTimeoutId == -1)
  ASPxClientSplitter.mouseMoveTimeoutId = _aspxSetTimeout(ASPxClientSplitter.SuspendedMouseMove, ASPxClientSplitter.timerInterval);
};
_aspxAttachEventToElement(window, "resize", ASPxClientSplitter.OnWindowResize);
_aspxAttachEventToDocument("click", ASPxClientSplitter.OnMouseClick);
_aspxAttachEventToDocument("mousedown", ASPxClientSplitter.OnMouseDown);
_aspxAttachEventToDocument("mouseup", ASPxClientSplitter.OnMouseUp);
_aspxAttachEventToDocument("mousemove", ASPxClientSplitter.OnMouseMove);
ASPxClientSplitterPaneEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function(pane) {
  this.constructor.prototype.constructor.call(this, pane);
  this.pane = pane;
 }
});
ASPxClientSplitterPaneCancelEventArgs = _aspxCreateClass(ASPxClientSplitterPaneEventArgs, {
 constructor: function(pane) {
  this.constructor.prototype.constructor.call(this, pane);
  this.cancel = false;
 }
});
