   �         .http://curriculum.qsi.org/DXR.axd?r=1_78-Lp3X3     %�-�s�     %yk���         
     O K           �      Cache-Control   public, max-age=31536000   Content-Type   text/javascript   Content-Encoding   gzip   Expires   Tue, 18 Dec 2012 21:13:05 GMT   Last-Modified   Mon, 19 Dec 2011 21:13:05 GMT   Server   Microsoft-IIS/7.5   X-Powered-By   ASP.NET   Date   Sat, 21 Oct 2017 11:46:56 GMT ASPxClientTreeView = _aspxCreateClass(ASPxClientControl, {
 DisabledCssClassName: "dxtvDisabled",
 ElbowCssClassName: "dxtv-elb",
 ElbowWithoutLineCssClassName: "dxtv-elbNoLn",
 ButtonCssClassName: "dxtv-btn",
 NodeCssClassName: "dxtv-nd",
 LineCssClassName: "dxtv-ln",
 NodeCheckboxCssClassName: "dxtv-ndChk",
 NodeImageCssClassName: "dxtv-ndImg",
 NodeTextSpanCssClassName: "dxtv-ndTxt",
 NodeTemplateCssClassName: "dxtv-ndTmpl",
 RtlCssClassName: "dxtvRtl",
 IndexPathSeparator: "_",
 NodeIDPrefix: "_N",
 NodeImageIDPostfix: "I",
 NodeLoadingPanelIDPostfix: "NLP",
 SampleExpandButtonIDPostfix: "_SEB",
 SampleCollapseButtonIDPostfix: "_SCB",
 SampleNodeLoadingPanelIDPostfix: "_SNLP",
 NodesStateHiddenInputIDPostfix: "_NSHF",
 ControlContentDivIDPostfix: "_CD",
 NodeCheckboxIDPostfix: "_CHK",
 ExpandNodeCommand: "E",
 ExpandAllNodesCommand: "EA",
 CheckNodeRecursiveCommand: "CHKNR",
 RaiseNodeClickEventCommand: "NCLK",
 RaiseExpandedChangingEventCommand: "ECHANGING",
 RaiseCheckedChangedEventCommand: "CCHNGD",
 PostRequestArgsSeparator: "|",
 NodeClickServerEventName: "NodeClick",
 ExpandedChangingServerEventName: "ExpandedChanging",
 CheckedChangedServerEventName: "CheckedChanged",
 AnimationDelay: 30,
 MaxAnimationTime: 400,
 AnimationOffset: 10,
 WidthMeasurementIncrement: 1000,
 IE6WidthMeasurementDivWidth: 99999,
 constructor: function (name) {
  this.constructor.prototype.constructor.call(this, name);
  this.enableAnimation = true;
  this.nodesInfo = null;
  this.nodesUrls = null;
  this.contentBoundsMode = true;
  this.checkNodesRecursive = false;
  this.allowSelectNode = false;
  this.virtualMode = false;
  this.imageProperties = null;
  this.icbFocusedStyle = [];
  var instance = this;
  this.expandCollapseHandler = function (e) { instance.HandleExpandButtonClick(e); };
  this.nodeClickHandler = function (e) { instance.HandleNodeClick(e); };
  this.nodeDblClickHandler = function (e) { instance.HandleNodeDblClick(e); };
  this.rootNode = new ASPxClientTreeViewNode();
  this.selectedNodeContentElementID = null;
  this.requireRaiseExpandedChangedList = [];
  this.initialControlWidth = 0;
  this.NodeClick = new ASPxClientEvent();
  this.ExpandedChanged = new ASPxClientEvent();
  this.ExpandedChanging = new ASPxClientEvent();
  this.CheckedChanged = new ASPxClientEvent();
 },
 ReplaceElementWithSampleElement: function (srcElement, sampleElement, copySrcInnerHtml) {
  var newElement = sampleElement.cloneNode(true);
  newElement.id = srcElement.id;
  _aspxSetElementDisplay(newElement, true);
  if (copySrcInnerHtml && srcElement.innerHTML)
   _aspxSetInnerHtml(newElement, srcElement.innerHTML);
  srcElement.parentNode.replaceChild(newElement, srcElement);
  return newElement;
 },
 ToggleExpandButtonClickHandler: function (attach, button) {
  var method = attach ? _aspxAttachEventToElement : _aspxDetachEventFromElement;
  method(button, "click", this.expandCollapseHandler);
 },
 AddElementCssClass: function (element, className) {
  this.RemoveElementCssClass(element, className);
  element.className = element.className + " " + className;
 },
 RemoveElementCssClass: function (element, className) {
  var newElementClassName = element.className.replace(className, "");
  element.className = _aspxTrim(newElementClassName);
 },
 RemoveEmptyTextNodes: function (element) {
  var nonEmptyTextPattern = /\S/;
  var textNodeType = 3;
  var elementNodeType = 1;
  for (var i = 0; i < element.childNodes.length; i++) {
   if (element.childNodes[i].nodeType == textNodeType &&
    !nonEmptyTextPattern.test(element.childNodes[i].nodeValue)) {
    element.removeChild(element.childNodes[i]);
    i--;
   } else if (element.childNodes[i].nodeType == elementNodeType)
    this.RemoveEmptyTextNodes(element.childNodes[i]);
  }
 },
 GetNodeIDByContentElementID: function (contentElementID) {
  return _aspxTrim(contentElementID.replace(this.name + "_", ""));
 },
 GetNodeIndexPathByContentElementID: function (contentElementID) {
  return _aspxTrim(contentElementID.replace(this.name + this.NodeIDPrefix, ""));
 },
 CreatePostRequestArgs: function (command, arg1, arg2) {
  var args = command + this.PostRequestArgsSeparator + arg1;
  if (arg2 || arg2 === "")
   args += this.PostRequestArgsSeparator + arg2;
  return args;
 },
 MergeNodesData: function (srcData, destData) {
  for (var key in srcData)
   destData[key] = srcData[key];
 },
 GetNodeListItem: function (clientNode) {
  var contentElement = _aspxGetElementById(clientNode.contentElementID);
  return _aspxGetParentByTagName(contentElement, "LI");
 },
 SerializeBooleanValue: function (value) {
  return value ? "T" : "";
 },
 GetContentElementByNodeID: function (nodeID) {
  return _aspxGetElementById(this.name + "_" + nodeID);
 },
 GetListItems: function (list) {
  var listNodes = _aspxGetElementNodes(list);
  var listItems = [];
  if (!listNodes)
   return null;
  for (var i = 0; i < listNodes.length; i++) {
   if (listNodes[i].tagName == "LI")
    listItems.push(listNodes[i]);
  }
  return listItems;
 },
 GetNodesStateHiddenInput: function () {
  return _aspxGetElementById(this.name + this.NodesStateHiddenInputIDPostfix);
 },
 GetClickedContentElementByEventArgs: function (e) {
  var clickedElement = _aspxGetEventSource(e);
  var contentElement = _aspxGetParentByClassName(clickedElement, this.NodeCssClassName);
  if (_aspxElementCssClassContains(clickedElement, this.NodeCheckboxCssClassName)) {
   if (__aspxFirefox) {
    _aspxPreventEventAndBubble(e);
    var instance = this;
    var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
    window.setTimeout(function () {
     ASPxCheckableElementHelper.Instance.InvokeClick(internalCheckBox, e);
    });
   }
   return null;
  }
  if (!contentElement || _aspxElementCssClassContains(contentElement, this.DisabledCssClassName))
   return null;
  return contentElement;
 },
 IsRightToLeft: function () {
  return _aspxIsElementRightToLeft(this.GetMainElement());
 },
 InlineInitialize: function () {
  this.SetInitialControlWidth();
  if(this.imageProperties)
   this.CreateInternalCheckBoxCollection();
  this.InitializeControlElements();
 },
 AdjustControlCore: function () {
  this.CorrectControlWidth();
 },
 CreateInternalCheckBoxCollection: function() {
    this.internalCheckBoxCollection = new ASPxCheckBoxInternalCollection(this.imageProperties);
 },
 AddInternalCheckBoxToCollection: function(icbMainElement, contentElement) {
  var instance = this;
  var internalCheckBox = this.internalCheckBoxCollection.Add(contentElement.id, icbMainElement);
  internalCheckBox.SetEnabled(!this.IsNodeDisabled(contentElement));
  internalCheckBox.readOnly = this.readOnly;
  internalCheckBox.CreateFocusDecoration(this.icbFocusedStyle);
  internalCheckBox.CheckedChanged.AddHandler(
   function(s, e) {
    instance.UpdateCheckedInNodesState(s.inputElement);
    instance.OnNodeCheckboxClick(s.inputElement);
   }
  );
 },
 InitializeControlElements: function () {
  var mainElement = this.GetMainElement();
  if (__aspxIE && __aspxBrowserVersion == 6)
   this.RemoveEmptyTextNodes(mainElement);
  if (_aspxElementCssClassContains(mainElement, this.DisabledCssClassName))
   return;
  var rootList = _aspxGetChildByTagName(mainElement, "UL", 0);
  this.InitializeNodeContainerElements(rootList, "", null);
  this.InitializeNodeSelection();
 },
 InitializeNodeSelection: function () {
  var contentElement = this.GetContentElementByNodeID(this.GetSelectedNodeIDFromState());
  if (contentElement)
   this.ApplySelectionToNode(contentElement);
 },
 GetNodeIndexPath: function (listItemIndex, parentIndexPath) {
  if (!parentIndexPath)
   return listItemIndex.toString();
  return parentIndexPath + this.IndexPathSeparator + listItemIndex.toString();
 },
 GetElementID: function (IDPrefix, indexPath) {
  return this.name + IDPrefix + indexPath;
 },
 ApplyServerProvidedClientNodeInfo: function (clientNode, indexPath) {
  if (!this.nodesInfo[indexPath])
   return;
  clientNode.clientEnabled = !!this.nodesInfo[indexPath][0];
  clientNode.clientVisible = !!this.nodesInfo[indexPath][1];
  clientNode.name = this.nodesInfo[indexPath][2];
  clientNode.navigateUrl = this.nodesInfo[indexPath][3];
  clientNode.target = this.nodesInfo[indexPath][4];
 },
 CreateClientNode: function (index, parentClientNode, indexPath) {
  if (!this.nodesInfo)
   return null;
  var clientNode = new ASPxClientTreeViewNode();
  clientNode.treeView = this;
  clientNode.parent = parentClientNode;
  clientNode.index = index;
  this.ApplyServerProvidedClientNodeInfo(clientNode, indexPath, null);
  if (parentClientNode)
   parentClientNode.nodes.push(clientNode);
  else
   this.rootNode.nodes.push(clientNode);
  return clientNode;
 },
 GetServerProvidedNodeIndex: function (listItem) {
  var nodeContentElement = _aspxGetChildrenByPartialClassName(listItem, this.NodeCssClassName)[0];
  if (!nodeContentElement || !nodeContentElement.id)
   return null;
  var nodeIndexPath = this.GetNodeIndexPathByContentElementID(nodeContentElement.id);
  var nodeIndices = nodeIndexPath.split(this.IndexPathSeparator);
  return parseInt(nodeIndices[nodeIndices.length - 1]);
 },
 InitializeNodeContainerElements: function (nodeContainer, parentIndexPath, parentClientNode) {
  var listItems = this.GetListItems(nodeContainer);
  if (!listItems)
   return;
  for (var i = 0, nodeIndex = 0; i < listItems.length; i++, nodeIndex++) {
   var serverProvidedNodeIndex = this.GetServerProvidedNodeIndex(listItems[i]);
   if (serverProvidedNodeIndex)
    nodeIndex = serverProvidedNodeIndex;
   var nodeIndexPath = this.GetNodeIndexPath(nodeIndex, parentIndexPath);
   var clientNode = this.CreateClientNode(i, parentClientNode, nodeIndexPath);
   if (clientNode)
    clientNode.last = i == listItems.length - 1;
   this.InitializeNodeContent(listItems[i], nodeIndexPath, clientNode);
   this.InitializeExpandButton(listItems[i]);
   if (clientNode) {
    if (!clientNode.clientVisible)
     this.SetNodeClientVisible(clientNode, false);
    if (!clientNode.clientEnabled)
     this.SetNodeClientEnabled(clientNode, false);
   }
   var subnodesList = _aspxGetChildByTagName(listItems[i], "UL", 0);
   if (subnodesList)
    this.InitializeNodeContainerElements(subnodesList, nodeIndexPath, clientNode);
  }
 },
 InitializeExpandButton: function (listItem) {
  var button = _aspxGetChildrenByPartialClassName(listItem, this.ButtonCssClassName)[0];
  if (button && !_aspxElementCssClassContains(button, this.DisabledCssClassName))
   this.ToggleExpandButtonClickHandler(true, button);
 },
 InitializeNodeContent: function (listItem, nodeIndexPath, clientNode) {
  var nodeContentElement = _aspxGetChildrenByPartialClassName(listItem, this.NodeCssClassName)[0];
  if (!nodeContentElement)
   return;
  var contentElementID = this.GetElementID(this.NodeIDPrefix, nodeIndexPath);
  if (clientNode) {
   clientNode.enabled = !this.IsNodeDisabled(nodeContentElement);
   clientNode.contentElementID = contentElementID;
   var textSpan = _aspxGetChildrenByPartialClassName(nodeContentElement, this.NodeTextSpanCssClassName)[0];
   clientNode.text = textSpan ? _aspxGetInnerText(textSpan) : "";
  }
  nodeContentElement.id = contentElementID;
  aspxAssignAccessabilityEventsToLink(nodeContentElement);
  if (this.contentBoundsMode) {
   _aspxAttachEventToElement(nodeContentElement, "click", this.nodeClickHandler);
   _aspxAttachEventToElement(nodeContentElement, "dblclick", this.nodeDblClickHandler);
  }
  this.InitializeNodeImage(nodeContentElement, clientNode);
  var icbMainElement = _aspxGetChildrenByPartialClassName(nodeContentElement, this.NodeCheckboxCssClassName)[0];
  if (icbMainElement) {
   var icbInputElement = _aspxGetChildByTagName(icbMainElement, "input", 0);
   icbInputElement.id = this.GetElementID(this.NodeCheckboxIDPostfix, nodeIndexPath);
   if(this.imageProperties)
    this.AddInternalCheckBoxToCollection(icbMainElement, nodeContentElement);
  }
 },
 IsNodeDisabled: function(nodeContentElement) {
  return _aspxElementCssClassContains(nodeContentElement, this.DisabledCssClassName);
 },
 InitializeNodeImage: function (nodeContentElement, clientNode) {
  var nodeImage = _aspxGetChildrenByPartialClassName(nodeContentElement, this.NodeImageCssClassName)[0];
  if (!nodeImage)
   return;
  nodeImage.id = nodeContentElement.id + this.NodeImageIDPostfix;
  if (clientNode)
   clientNode.imageUrl = nodeImage.src;
 },
 GetControlContentDiv: function () {
  return _aspxGetElementById(this.name + this.ControlContentDivIDPostfix);
 },
 SetInitialControlWidth: function () {
  var mainElement = this.GetMainElement();
  if (mainElement.style.width && mainElement.style.width.indexOf("%") < 0)
   this.initialControlWidth = mainElement.offsetWidth;
 },
 CorrectControlWidth: function () {
  var mainElement = this.GetMainElement();
  var controlContentDiv = this.GetControlContentDiv();
  var rootNodesList = _aspxGetChildByTagName(controlContentDiv, "UL", 0);
  if (!rootNodesList)
   return;
  if (this.IsRightToLeft() && __aspxIE && __aspxBrowserVersion <= 7)
   this.RemoveElementCssClass(mainElement, this.RtlCssClassName);
  mainElement.style.overflow = "hidden";
  _aspxSetElementFloat(rootNodesList, "left");
  var prevListWidth = 0;
  if (__aspxIE && __aspxBrowserVersion == 6)
   _aspxSetOffsetWidth(controlContentDiv, this.IE6WidthMeasurementDivWidth);
  else {
   do {
    prevListWidth = rootNodesList.offsetWidth;
    _aspxSetOffsetWidth(controlContentDiv, controlContentDiv.offsetWidth + this.WidthMeasurementIncrement);
    if (__aspxOpera) {
     rootNodesList.style.width = "100%";
     var dummy = rootNodesList.offsetWidth;
     rootNodesList.style.width = "";
    }
   } while (prevListWidth != rootNodesList.offsetWidth);
  }
  if (rootNodesList.offsetWidth > this.initialControlWidth){
   var roundingCorrection = __aspxBrowserWithHardwareAcceleration ? 1 : 0; 
   mainElement.style.width = rootNodesList.offsetWidth + roundingCorrection + "px";
  }
  _aspxSetElementFloat(rootNodesList, "");
  mainElement.style.overflow = "";
  controlContentDiv.style.width = "";
  if (this.IsRightToLeft() && __aspxIE && __aspxBrowserVersion <= 7)
   this.AddElementCssClass(mainElement, this.RtlCssClassName);
 },
 GetPreviousSiblingNodeListItem: function (clientNode) {
  var previousNodeIndex = clientNode.index - 1;
  if (previousNodeIndex < 0)
   return null;
  var previousClientNode = clientNode.parent ? clientNode.parent.GetNode(previousNodeIndex) :
   this.rootNode.nodes[previousNodeIndex];
  return this.GetNodeListItem(previousClientNode);
 },
 GetListItemElbowSpan: function (listItem) {
  return _aspxGetChildrenByPartialClassName(listItem, this.ElbowCssClassName)[0] ||
      _aspxGetChildrenByPartialClassName(listItem, this.ElbowWithoutLineCssClassName)[0];
 },
 SetNodeClientVisible: function (clientNode, clientVisible) {
  var listItem = this.GetNodeListItem(clientNode);
  _aspxSetElementDisplay(listItem, clientVisible);
  this.CorrectControlWidth();
  if (!clientNode.last)
   return;
  var previousNodeListItem = this.GetPreviousSiblingNodeListItem(clientNode);
  if (!previousNodeListItem)
   return;
  var previousNodeElbowSpan = this.GetListItemElbowSpan(previousNodeListItem);
  if (_aspxElementCssClassContains(previousNodeElbowSpan, this.ElbowWithoutLineCssClassName))
   return;
  this.InitializeExpandButton(previousNodeListItem);
  if (clientVisible)
   this.AddElementCssClass(previousNodeListItem, this.LineCssClassName);
  else
   this.RemoveElementCssClass(previousNodeListItem, this.LineCssClassName);
 },
 SetNodeClientEnabled: function (clientNode, clientEnabled) {
  var contentElement = _aspxGetElementById(clientNode.contentElementID);
  aspxGetStateController().SetElementEnabled(contentElement, clientEnabled);
  if(this.internalCheckBoxCollection) {
   var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
   internalCheckBox.SetEnabled(clientEnabled);
  }
  var listItem = _aspxGetParentByTagName(contentElement, "LI");
  var button = _aspxGetChildrenByPartialClassName(listItem, this.ButtonCssClassName)[0];
  if (button) {
   this.ToggleExpandButtonClickHandler(clientEnabled, button);
   button.style.cursor = clientEnabled ? "pointer" : "default";
  }
 },
 SetNodeText: function (clientNode, text) {
  var contentElement = _aspxGetElementById(clientNode.contentElementID);
  var textSpan = _aspxGetChildrenByPartialClassName(contentElement, this.NodeTextSpanCssClassName)[0];
  if (textSpan)
   _aspxSetInnerHtml(textSpan, text);
 },
 SetNodeImageUrl: function (clientNode, url) {
  var contentElement = _aspxGetElementById(clientNode.contentElementID);
  var nodeImage = _aspxGetChildrenByPartialClassName(contentElement, this.NodeImageCssClassName)[0];
  if (nodeImage)
   nodeImage.src = url;
 },
 GetNodeLinkElement: function (clientNode) {
  var contentElement = _aspxGetElementById(clientNode.contentElementID);
  if (_aspxElementCssClassContains(contentElement, this.NodeTemplateCssClassName))
   return null;
  return contentElement.tagName == "A" ? contentElement : _aspxGetChildByTagName(contentElement, "A", 0);
 },
 GetNodeNavigateUrl: function (clientNode) {
  if (this.contentBoundsMode)
   return clientNode.navigateUrl;
  var nodeLink = this.GetNodeLinkElement(clientNode);
  return nodeLink ? nodeLink.href : "";
 },
 SetNodeNavigateUrl: function (clientNode, url) {
  if (this.contentBoundsMode) {
   clientNode.navigateUrl = url;
   return;
  }
  var nodeLink = this.GetNodeLinkElement(clientNode);
  if (nodeLink)
   nodeLink.href = url;
 },
 UpdateCheckedInNodesState: function (checkbox) {
  var contentElement = _aspxGetParentByClassName(checkbox, this.NodeCssClassName);
  var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
  var value = internalCheckBox.GetCurrentInputKey();
  var nodesStateInput = this.GetNodesStateHiddenInput();
  var nodesState = eval("(" + nodesStateInput.value + ");");
  var nodeID = this.GetNodeIDByContentElementID(contentElement.id);
  nodesState[2][nodeID] = value;
  nodesStateInput.value = _aspxToJson(nodesState);
 },
 UpdateRecursiveCheckedNodesStateOnCallback: function (checkState, nodeIDs) {
  this.HideLoadingPanel();
  var nodesStateInput = this.GetNodesStateHiddenInput();
  var nodesState = eval("(" + nodesStateInput.value + ");");
  for (var i = 0; i < nodeIDs.length; i++) {
   if(nodesState[2][nodeIDs[i]] != checkState)
    nodesState[2][nodeIDs[i]] = checkState;
  }
  nodesStateInput.value = _aspxToJson(nodesState);
 },
 CreateRecursiveNodeCheckRequest: function (contentElement) {
  var requestArgs = this.CreatePostRequestArgs(this.CheckNodeRecursiveCommand,
    this.GetNodeIDByContentElementID(contentElement.id));
  if (this.autoPostBack) {
   if (this.isInitialized)
    this.SendPostBack(requestArgs);
   return;
  }
  if (this.callBack) {
   var mainElement = this.GetMainElement();
   this.CreateLoadingDiv(mainElement);
   this.CreateLoadingPanelWithAbsolutePosition(mainElement);
   this.CreateCallback(requestArgs);
  }
 },
 OnNodeCheckboxClick: function (checkbox) {
  var contentElement = _aspxGetParentByClassName(checkbox, this.NodeCssClassName);
  var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
  if (this.checkNodesRecursive) {
   var checkBoxState = internalCheckBox.GetCurrentInputKey();
   this.UpdateCheckedStateRecursive(checkbox, checkBoxState);
  }
  var processOnServer = this.RaiseCheckedChanged(contentElement);
  if (this.checkNodesRecursive && !this.virtualMode && (this.autoPostBack || this.callBack))
   this.CreateRecursiveNodeCheckRequest(contentElement);
  else if (processOnServer) {
   var requestArgs = this.CreatePostRequestArgs(this.RaiseCheckedChangedEventCommand,
    this.GetNodeIDByContentElementID(contentElement.id));
   if (this.isInitialized)
    this.SendPostBack(requestArgs);
  }
 },
 UpdateCheckedStateRecursive: function (checkbox, state) {
  var listItem = _aspxGetParentByTagName(checkbox, "LI");
  this.UpdateDescendantsCheckedState(listItem, state);
  this.UpdateAncestorsCheckedState(listItem);
 },
 UpdateDescendantsCheckedState: function (listItem, state) {
  var subnodesList = _aspxGetChildByTagName(listItem, "UL", 0);
  if (!subnodesList) {
   listItem.requireUpdateCheckedState = true;
   listItem.checkedState = state;
   return;
  }
  var descendantListItems = this.GetListItems(subnodesList);
  for (var i = 0; i < descendantListItems.length; i++) {
   var contentElement = _aspxGetChildrenByPartialClassName(descendantListItems[i], this.NodeCssClassName)[0];
   var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
   if(internalCheckBox) {
    internalCheckBox.SetValue(state);
    this.UpdateCheckedInNodesState(internalCheckBox.inputElement);
   }
   this.UpdateDescendantsCheckedState(descendantListItems[i], state);
  }
 },
 UpdateAncestorsCheckedState: function (listItem) {
  var parentSubnodesList = _aspxGetParentByTagName(listItem, "UL");
  var parentListItem = _aspxGetParentByTagName(parentSubnodesList, "LI");
  if (!parentListItem || !_aspxGetParentById(parentListItem, this.name))
   return;
  var parentChecked = true;
  var parentUnchecked = true;
  var siblingListItems = this.GetListItems(parentSubnodesList);
  for (var i = 0; i < siblingListItems.length; i++) {
   var contentElement = _aspxGetChildrenByPartialClassName(siblingListItems[i], this.NodeCssClassName)[0];
   var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
   if(internalCheckBox) {
    var currentCheckBoxState = internalCheckBox.GetCurrentInputKey();
    if(currentCheckBoxState != ASPxClientCheckBoxInputKey.Checked)
     parentChecked = false;
    if(currentCheckBoxState != ASPxClientCheckBoxInputKey.Unchecked)
     parentUnchecked = false;
   }
  }
  var parentCheckboxContentElement = _aspxGetChildrenByPartialClassName(parentListItem, this.NodeCssClassName)[0];
  if (parentCheckboxContentElement) {
   var parentCheckBoxState = parentChecked ? ASPxClientCheckBoxInputKey.Checked : (parentUnchecked ? ASPxClientCheckBoxInputKey.Unchecked : ASPxClientCheckBoxInputKey.Indeterminate);
   var parentInternalCheckBox = this.internalCheckBoxCollection.Get(parentCheckboxContentElement.id);
   if(parentInternalCheckBox) {
    parentInternalCheckBox.SetValue(parentCheckBoxState);
    this.UpdateCheckedInNodesState(parentInternalCheckBox.inputElement);
   }
  }
  this.UpdateAncestorsCheckedState(parentListItem);
 },
 SetNodeState: function (clientNode, state) {
  var contentElement = _aspxGetElementById(clientNode.contentElementID);
  var checkbox = _aspxGetChildrenByPartialClassName(contentElement, this.NodeCheckboxCssClassName)[0];
  var stateKey = ASPxClientCheckBoxInputKey[state];
  var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
  if(internalCheckBox) {
   internalCheckBox.SetValue(stateKey);
   this.UpdateCheckedInNodesState(internalCheckBox.inputElement);
  }
  if (this.checkNodesRecursive && checkbox)
   this.UpdateCheckedStateRecursive(checkbox, stateKey);
 },
 GetNodeState: function (clientNode) {
  var contentElement = _aspxGetElementById(clientNode.contentElementID);
  var internalCheckBox = this.internalCheckBoxCollection.Get(contentElement.id);
  return internalCheckBox ? internalCheckBox.GetCurrentCheckState() : ASPxClientCheckBoxCheckState.Unchecked;
 },
 GetSelectedNodeIDFromState: function () {
  var nodesStateInput = this.GetNodesStateHiddenInput();
  var nodesState = eval("(" + nodesStateInput.value + ");");
  return nodesState ? nodesState[1] : "";
 },
 SetSelectedNodeIDToState: function (nodeID) {
  var nodesStateInput = this.GetNodesStateHiddenInput();
  var nodesState = eval("(" + nodesStateInput.value + ");");
  if (!nodesState || !_aspxIsExists(nodesState[1]))
   return;
  nodesState[1] = nodeID;
  nodesStateInput.value = _aspxToJson(nodesState);
 },
 NavigateToNodeLink: function (contentElementID) {
  var navigateUrl = null;
  var target = null;
  if (this.rootNode.nodes.length > 0) {
   var clientNode = this.rootNode.GetNodeByContentElementID(contentElementID);
   navigateUrl = clientNode.navigateUrl;
   target = clientNode.target;
  } else {
   var nodeIndexPath = this.GetNodeIndexPathByContentElementID(contentElementID);
   if (!this.nodesUrls[nodeIndexPath])
    return;
   navigateUrl = this.nodesUrls[nodeIndexPath][0];
   target = this.nodesUrls[nodeIndexPath][1];
  }
  if (navigateUrl)
   _aspxNavigateUrl(navigateUrl, target || "");
 },
 ApplySelectionToNode: function (contentElement) {
  var previouslySelectedContentElement = _aspxGetElementById(this.selectedNodeContentElementID);
  if (previouslySelectedContentElement)
   aspxGetStateController().DeselectElementBySrcElement(previouslySelectedContentElement);
  if (contentElement) {
   aspxGetStateController().SelectElementBySrcElement(contentElement);
   this.CorrectControlWidth();
   this.selectedNodeContentElementID = contentElement.id;
  } else
   this.selectedNodeContentElementID = null;
 },
 HandleNodeClick: function (e) {
  var contentElement = this.GetClickedContentElementByEventArgs(e);
  if (!contentElement)
   return;
  if (this.allowSelectNode && this.selectedNodeContentElementID != contentElement.id) {
   this.SetSelectedNodeIDToState(this.GetNodeIDByContentElementID(contentElement.id));
   aspxClearHoverState();
   this.ApplySelectionToNode(contentElement);
   aspxUpdateHoverState(e);
  }
  var processEventOnServer = this.RaiseNodeClick(contentElement, e);
  if (contentElement.tagName != "A")
   this.NavigateToNodeLink(contentElement.id);
  if (processEventOnServer) {
   var postbackArgs = this.CreatePostRequestArgs(this.RaiseNodeClickEventCommand,
    this.GetNodeIDByContentElementID(contentElement.id));
   if (this.isInitialized)
    this.SendPostBack(postbackArgs);
  }
 },
 OnCallback: function (resultObj) {
  if (!resultObj)
   return;
  switch (resultObj[0]) {
   case this.ExpandNodeCommand:
    if(resultObj[1])
     this.ProcessNodeExpandingOnCallback(resultObj[1], resultObj[2], resultObj[3], resultObj[4]);
    else
     this.ProcessAllNodesExpandingOnCallback(resultObj[2], resultObj[3], resultObj[4]);
    break;
   case this.CheckNodeRecursiveCommand:
    this.UpdateRecursiveCheckedNodesStateOnCallback(resultObj[1], resultObj[2]);
    break;
  }
 },
 GetSampleNodeLoadingPanel: function () {
  return _aspxGetElementById(this.name + this.SampleNodeLoadingPanelIDPostfix);
 },
 GetNodeLoadingPanelID: function (nodeID) {
  return this.name + this.NodeLoadingPanelIDPostfix + nodeID;
 },
 ShowNodeLoadingPanel: function (button, nodeID) {
  var sampleLoadingPanel = this.GetSampleNodeLoadingPanel();
  if (!sampleLoadingPanel || !button) {
   var mainElement = this.GetMainElement();
   this.CreateLoadingDiv(mainElement);
   this.CreateLoadingPanelWithAbsolutePosition(mainElement);
   return;
  }
  var elbowSpan = _aspxGetParentByTagName(button, "SPAN");
  var panel = this.CloneNodeLoadingPanel(sampleLoadingPanel, nodeID, elbowSpan);
  _aspxSetElementDisplay(panel, true);
  this.SetNodeLoadingPanelPosition(panel, button, elbowSpan);
  _aspxSetElementDisplay(button, false);
 },
 HideNodeLoadingPanel: function (nodeID) {
  var panel = _aspxGetElementById(this.GetNodeLoadingPanelID(nodeID));
  if (panel)
   _aspxRemoveElement(panel);
 },
 SetNodeLoadingPanelPosition: function (panel, button, elbowSpan) {
  elbowSpan.style.position = "relative";
  var leftOffset = button.offsetLeft - Math.round((panel.offsetWidth - button.offsetWidth) / 2);
  var topOffset = button.offsetTop - Math.round((panel.offsetHeight - button.offsetHeight) / 2);
  elbowSpan.style.position = "";
  if (this.IsRightToLeft())
   panel.style.marginRight = elbowSpan.offsetWidth - panel.offsetWidth - leftOffset + "px";
  else
   panel.style.marginLeft = leftOffset + "px";
  panel.style.marginTop = topOffset + "px";
 },
 CloneNodeLoadingPanel: function (sampleLoadingPanel, nodeID, elbowSpan) {
  var clonedPanel = sampleLoadingPanel.cloneNode(true);
  clonedPanel.id = this.GetNodeLoadingPanelID(nodeID);
  clonedPanel.dir = "ltr";
  elbowSpan.appendChild(clonedPanel);
  return clonedPanel;
 },
 GetSampleExpandButton: function () {
  return _aspxGetElementById(this.name + this.SampleExpandButtonIDPostfix);
 },
 GetSampleCollapseButton: function () {
  return _aspxGetElementById(this.name + this.SampleCollapseButtonIDPostfix);
 },
 SetExpandedToState: function (nodeID, expanded) {
  var nodesStateInput = this.GetNodesStateHiddenInput()
  var nodesState = eval("(" + nodesStateInput.value + ");");
  nodesState[0][nodeID] = this.SerializeBooleanValue(expanded);
  nodesStateInput.value = _aspxToJson(nodesState);
 },
 GetExpandedDataFromState: function () {
  var nodesStateInput = this.GetNodesStateHiddenInput()
  var nodesState = eval("(" + nodesStateInput.value + ");");
  return nodesState[0];
 },
 HandleNodeDblClick: function (e) {
  var contentElement = this.GetClickedContentElementByEventArgs(e);
  if (!contentElement)
   return;
  var listItem = _aspxGetParentByTagName(contentElement, "LI");
  var button = _aspxGetChildrenByPartialClassName(listItem, this.ButtonCssClassName)[0];
  var expandedState = this.GetExpandedDataFromState();
  var nodeID = this.GetNodeIDByContentElementID(contentElement.id);
  if (!button && !_aspxIsExists(expandedState[nodeID]))
   return;
  this.ProcessUserInitiatedExpandCollapse(button, listItem);
 },
 InsertSubnodesListMarkup: function (listItem, subnodesListMarkup) {
  var fakeDiv = document.createElement("DIV");
  _aspxSetInnerHtml(fakeDiv, subnodesListMarkup);
  while (fakeDiv.childNodes.length != 0)
   listItem.appendChild(fakeDiv.childNodes[0]);
 },
 ProcessAllNodesExpandingOnCallback: function (subnodesListMarkup, nodesData, nodeNames) {
  this.HideLoadingPanel();
  var nodesStateInput = this.GetNodesStateHiddenInput()
  var nodesState = eval("(" + nodesStateInput.value + ");");
  for (var i = 0; i < nodesData.length; i++) {
   nodesState[0][nodesData[i][0]] = 'T';
  }
  nodesStateInput.value = _aspxToJson(nodesState);
  this.MergeRetrievedOnCallbackNodeInfo(nodesData, nodeNames);
  var contentDiv = this.GetControlContentDiv();
  contentDiv.innerHTML = subnodesListMarkup;
  var subnodesList = _aspxGetChildByTagName(contentDiv, "UL", 0);
  this.rootNode.nodes = [];
  this.InitializeNodeContainerElements(subnodesList, "", null);
  this.InitializeNodeSelection();
  this.AdjustControl();
 },
 MergeRetrievedOnCallbackNodeInfo: function (nodesData, nodeNames) {
  if (nodesData) {
   var destData = this.nodesInfo || this.nodesUrls;
   this.MergeNodesData(nodesData, destData);
  }
  if (nodeNames) {
   var nodesStateInput = this.GetNodesStateHiddenInput();
   var nodesState = eval("(" + nodesStateInput.value + ");");
   this.MergeNodesData(nodeNames, nodesState[3]);
   nodesStateInput.value = _aspxToJson(nodesState);
  }
 },
 ProcessNodeExpandingOnCallback: function (nodeID, subnodesListMarkup, nodesData, nodeNames) {
  this.MergeRetrievedOnCallbackNodeInfo(nodesData, nodeNames);
  var contentElement = this.GetContentElementByNodeID(nodeID);
  contentElement.performingExpandNodeRequest = false;
  this.HideNodeLoadingPanel(this.GetNodeIDByContentElementID(contentElement.id));
  var listItem = _aspxGetParentByTagName(contentElement, "LI");
  this.InsertSubnodesListMarkup(listItem, subnodesListMarkup);
  var subnodesList = _aspxGetChildByTagName(listItem, "UL", 0);
  var nodeIndexPath = this.GetNodeIndexPathByContentElementID(contentElement.id);
  var clientNode = null;
  if (this.rootNode.nodes.length > 0)
   clientNode = this.rootNode.GetNodeByContentElementID(contentElement.id);
  if (__aspxIE && __aspxBrowserVersion == 6)
   this.RemoveEmptyTextNodes(subnodesList);
  this.InitializeNodeContainerElements(subnodesList, nodeIndexPath, clientNode);
  this.InitializeNodeSelection();
  if (listItem.requireUpdateCheckedState)
   this.UpdateDescendantsCheckedState(listItem, listItem.checkedState);
  var button = _aspxGetChildrenByPartialClassName(listItem, this.ButtonCssClassName)[0];
  this.PerformNodeExpand(subnodesList, button);
 },
 HandleExpandButtonClick: function (e) {
  var button = _aspxGetEventSource(e);
  var listItem = _aspxGetParentByTagName(button, "LI");
  this.ProcessUserInitiatedExpandCollapse(button, listItem);
 },
 ProcessUserInitiatedExpandCollapse: function (button, listItem) {
  var contentElement = _aspxGetChildrenByPartialClassName(listItem, this.NodeCssClassName)[0];
  if (contentElement.performingExpandNodeRequest)
   return;
  var expandedChangingResults = this.RaiseExpandedChanging(listItem);
  if (expandedChangingResults.cancel)
   return;
  this.ToggleNodeExpandCollapse(listItem, button, true, expandedChangingResults.processOnServer);
 },
 ToggleNodeExpandCollapse: function (listItem, button, requireRaiseExpandedChanged, processOnServer) {
  var subnodesList = _aspxGetChildByTagName(listItem, "UL", 0);
  var expanding = !subnodesList || subnodesList.style.display == "none";
  var contentElement = _aspxGetChildrenByPartialClassName(listItem, this.NodeCssClassName)[0];
  if (processOnServer) {
   var requestArgs = this.CreatePostRequestArgs(this.RaiseExpandedChangingEventCommand,
    this.GetNodeIDByContentElementID(contentElement.id), this.SerializeBooleanValue(expanding));
   if (this.isInitialized)
    this.SendPostBack(requestArgs);
   return;
  }
  this.SetExpandedToState(this.GetNodeIDByContentElementID(contentElement.id), expanding);
  if (requireRaiseExpandedChanged)
   this.requireRaiseExpandedChangedList.push(contentElement.id);
  if (subnodesList) {
   if (expanding)
    this.PerformNodeExpand(subnodesList, button);
   else
    this.PerformNodeCollapse(subnodesList, button);
   return;
  }
  contentElement.performingExpandNodeRequest = true;
  this.SendExpandNodePostRequest(contentElement.id, button);
 },
 SendExpandNodePostRequest: function (contentElementID, button) {
  var requestArgs = this.CreatePostRequestArgs(this.ExpandNodeCommand,
   this.GetNodeIDByContentElementID(contentElementID));
  if (this.autoPostBack || !this.callBack) {
   if (this.isInitialized)
    this.SendPostBack(requestArgs);
   return;
  }
  this.ShowNodeLoadingPanel(button, this.GetNodeIDByContentElementID(contentElementID));
  this.CreateCallback(requestArgs);
 },
 HandleExpandCollapseAnimation: function (subnodesList) {
  subnodesList.animationIterationCount++;
  var newHeight = subnodesList.offsetHeight + subnodesList.animationIterationCount *
   (subnodesList.expanding ? this.AnimationOffset : -this.AnimationOffset);
  var finished = (subnodesList.expanding ? (newHeight >= subnodesList.initialHeight) :
   (newHeight <= 0)) || (new Date() - subnodesList.animationStart > this.MaxAnimationTime);
  if (finished) {
   subnodesList.style.height = "";
   if (!subnodesList.expanding) {
    _aspxSetElementDisplay(subnodesList, false);
    this.CorrectControlWidth();
   }
   this.RaiseExpandedChanged(subnodesList);
   return;
  }
  _aspxSetOffsetHeight(subnodesList, newHeight);
  var instance = this;
  window.setTimeout(function () { instance.HandleExpandCollapseAnimation(subnodesList) },
   this.AnimationDelay);
 },
 StartExpandCollapseAnimation: function (subnodesList, expanding) {
  subnodesList.expanding = expanding;
  subnodesList.animationStart = new Date();
  subnodesList.initialHeight = subnodesList.offsetHeight;
  subnodesList.animationIterationCount = 0;
  if (expanding)
   _aspxSetOffsetHeight(subnodesList, 0);
  var instance = this;
  window.setTimeout(function () { instance.HandleExpandCollapseAnimation(subnodesList) },
   this.AnimationDelay);
 },
 ReplaceExpandButtonWithSampleButton: function (button, sampleButton) {
  var newButton = this.ReplaceElementWithSampleElement(button, sampleButton, false);
  var listItem = _aspxGetParentByTagName(newButton, "LI");
  var contentElement = _aspxGetChildrenByPartialClassName(listItem, this.NodeCssClassName)[0];
  if (!_aspxElementCssClassContains(contentElement, this.DisabledCssClassName))
   this.ToggleExpandButtonClickHandler(true, newButton);
  else
   newButton.style.cursor = "default";
 },
 AccomplishExpandCollapse: function (expandButton, sampleButton, subnodesList) {
  if (expandButton)
   this.ReplaceExpandButtonWithSampleButton(expandButton, sampleButton);
  if (!this.enableAnimation)
   this.RaiseExpandedChanged(subnodesList);
 },
 PerformNodeExpand: function (subnodesList, expandButton) {
  _aspxSetElementDisplay(subnodesList, true);
  this.CorrectControlWidth();
  if (this.enableAnimation)
   this.StartExpandCollapseAnimation(subnodesList, true);
  this.AccomplishExpandCollapse(expandButton, this.GetSampleCollapseButton(), subnodesList);
 },
 PerformNodeCollapse: function (subnodesList, expandButton) {
  if (this.enableAnimation)
   this.StartExpandCollapseAnimation(subnodesList, false);
  else {
   _aspxSetElementDisplay(subnodesList, false);
   this.CorrectControlWidth();
  }
  this.AccomplishExpandCollapse(expandButton, this.GetSampleExpandButton(), subnodesList);
 },
 GetNodeExpanded: function (clientNode) {
  var expandedState = this.GetExpandedDataFromState();
  var nodeID = this.GetNodeIDByContentElementID(clientNode.contentElementID);
  if (_aspxIsExists(expandedState[nodeID]))
   return !!expandedState[nodeID];
  return false;
 },
 SetNodeExpanded: function (clientNode) {
  var listItem = this.GetNodeListItem(clientNode);
  var button = _aspxGetChildrenByPartialClassName(listItem, this.ButtonCssClassName)[0];
  var nodeID = this.GetNodeIDByContentElementID(clientNode.contentElementID);
  var expandedState = this.GetExpandedDataFromState();
  if (!button && !_aspxIsExists(expandedState[nodeID]))
   return;
  this.ToggleNodeExpandCollapse(listItem, button, false, false);
 },
 RaiseNodeClick: function (contentElement, htmlEvent) {
  var processOnServer = this.autoPostBack || this.IsServerEventAssigned(this.NodeClickServerEventName);
  if (!this.NodeClick.IsEmpty()) {
   var clientNode = this.rootNode.GetNodeByContentElementID(contentElement.id);
   var args = new ASPxClientTreeViewNodeClickEventArgs(processOnServer, clientNode,
    contentElement, htmlEvent);
   this.NodeClick.FireEvent(this, args);
   processOnServer = args.processOnServer;
  }
  return processOnServer;
 },
 RaiseExpandedChanged: function (subnodesList) {
  if (this.ExpandedChanged.IsEmpty())
   return;
  var listItem = _aspxGetParentByTagName(subnodesList, "LI");
  var contentElement = _aspxGetChildrenByPartialClassName(listItem, this.NodeCssClassName)[0];
  var nodeIndex = _aspxArrayIndexOf(this.requireRaiseExpandedChangedList, contentElement.id);
  if (nodeIndex < 0)
   return;
  this.requireRaiseExpandedChangedList.splice(nodeIndex, 1);
  var clientNode = this.rootNode.GetNodeByContentElementID(contentElement.id);
  var args = new ASPxClientTreeViewNodeEventArgs(clientNode);
  this.ExpandedChanged.FireEvent(this, args);
 },
 RaiseExpandedChanging: function (listItem) {
  var processOnServer = this.autoPostBack || this.IsServerEventAssigned(this.ExpandedChangingServerEventName);
  var contentElement = _aspxGetChildrenByPartialClassName(listItem, this.NodeCssClassName)[0];
  var clientNode = this.rootNode.GetNodeByContentElementID(contentElement.id);
  var args = new ASPxClientTreeViewNodeCancelEventArgs(processOnServer, clientNode);
  if (!this.ExpandedChanging.IsEmpty())
   this.ExpandedChanging.FireEvent(this, args);
  return args;
 },
 RaiseCheckedChanged: function (contentElement) {
  var processOnServer = this.autoPostBack || this.IsServerEventAssigned(this.CheckedChangedServerEventName);
  if (!this.CheckedChanged.IsEmpty()) {
   var clientNode = this.rootNode.GetNodeByContentElementID(contentElement.id);
   var args = new ASPxClientTreeViewNodeProcessingModeEventArgs(processOnServer, clientNode);
   this.CheckedChanged.FireEvent(this, args);
   processOnServer = args.processOnServer;
  }
  return processOnServer;
 },
 GetNode: function (index) {
  return this.rootNode.GetNode(index);
 },
 GetNodeByName: function (name) {
  return this.rootNode.GetNodeByName(name);
 },
 GetNodeByText: function (text) {
  return this.rootNode.GetNodeByText(text);
 },
 GetNodeCount: function () {
  return this.rootNode.GetNodeCount();
 },
 GetSelectedNode: function () {
  return this.rootNode.GetNodeByContentElementID(this.selectedNodeContentElementID);
 },
 SetSelectedNode: function (node) {
  if ((node && node.treeView != this) || !this.allowSelectNode)
   return;
  var contentElement = node ? _aspxGetElementById(node.contentElementID) : null;
  var selectedNodeID = contentElement ? this.GetNodeIDByContentElementID(contentElement.id) : "";
  this.SetSelectedNodeIDToState(selectedNodeID);
  this.ApplySelectionToNode(contentElement);
 },
 GetRootNode: function () {
  return this.rootNode;
 },
 ExpandCollapseNodesRecursive: function (clientNodes, expand) {
  for (var i = 0; i < clientNodes.length; i++) {
   clientNodes[i].SetExpanded(expand);
   if (clientNodes[i].nodes.length > 0)
    this.ExpandCollapseNodesRecursive(clientNodes[i].nodes, expand);
  }
 },
 CollapseAll: function () {
  if (this.rootNode.nodes.length == 0)
   return;
  this.ExpandCollapseNodesRecursive(this.rootNode.nodes, false);
 },
 ExpandAll: function () {
  if (this.rootNode.nodes.length == 0)
   return;
  var postRequestArgs = this.CreatePostRequestArgs(this.ExpandAllNodesCommand, "");
  if (this.autoPostBack) {
   if (this.isInitialized)
    this.SendPostBack(postRequestArgs);
   return;
  }
  if (this.callBack) {
   var mainElement = this.GetMainElement();
   this.CreateLoadingDiv(mainElement);
   this.CreateLoadingPanelWithAbsolutePosition(mainElement);
   this.CreateCallback(postRequestArgs);
   return;
  }
  this.ExpandCollapseNodesRecursive(this.rootNode.nodes, true);
 }
});
ASPxClientTreeView.Cast = ASPxClientControl.Cast;
ASPxClientTreeViewNode = _aspxCreateClass(null, {
 constructor: function (treeView, parent, index, name) {
  this.treeView = treeView;
  this.parent = parent;
  this.index = index;
  this.name = name;
  this.enabled = true;
  this.clientEnabled = true;
  this.clientVisible = true;
  this.navigateUrl = null;
  this.target = null;
  this.text = null;
  this.imageUrl = null;
  this.nodes = [];
  this.contentElementID = null;
  this.last = false;
 },
 GetNodeCount: function () {
  return this.nodes.length;
 },
 GetNode: function (index) {
  return (index >= 0 && index < this.nodes.length) ? this.nodes[index] : null;
 },
 GetNodeBySelector: function (selector) {
  for (var i = 0; i < this.nodes.length; i++) {
   if (selector(this.nodes[i]))
    return this.nodes[i];
   var foundNode = this.nodes[i].GetNodeBySelector(selector);
   if (foundNode)
    return foundNode;
  }
  return null;
 },
 GetNodeByContentElementID: function (contentElementID) {
  return this.GetNodeBySelector(function (node) { return node.contentElementID == contentElementID; });
 },
 SetCheckState: function (value) {
  this.treeView.SetNodeState(this, value);
 },
 GetNodeByName: function (name) {
  return this.GetNodeBySelector(function (node) { return node.name == name; });
 },
 GetNodeByText: function (text) {
  return this.GetNodeBySelector(function (node) { return node.GetText() == text });
 },
 GetExpanded: function () {
  return this.treeView.GetNodeExpanded(this);
 },
 SetExpanded: function (value) {
  if (this.GetExpanded() == value)
   return;
  this.treeView.SetNodeExpanded(this);
 },
 GetChecked: function () {
  return this.GetCheckState() == ASPxClientCheckBoxCheckState.Checked;
 },
 SetChecked: function (value) {
  this.SetCheckState(value ? ASPxClientCheckBoxCheckState.Checked : ASPxClientCheckBoxCheckState.Unchecked);
 },
 GetCheckState: function () {
  return this.treeView.GetNodeState(this);
 },
 GetEnabled: function () {
  return this.enabled && this.clientEnabled;
 },
 SetEnabled: function (value) {
  this.clientEnabled = value;
  this.treeView.SetNodeClientEnabled(this, this.clientEnabled);
 },
 GetImageUrl: function () {
  return this.imageUrl;
 },
 SetImageUrl: function (value) {
  this.imageUrl = value;
  this.treeView.SetNodeImageUrl(this, value);
 },
 GetNavigateUrl: function () {
  return this.treeView.GetNodeNavigateUrl(this);
 },
 SetNavigateUrl: function (value) {
  this.treeView.SetNodeNavigateUrl(this, value);
 },
 GetText: function () {
  var nbspChar = String.fromCharCode(160)
  return this.text.replace(new RegExp(nbspChar, "g"), " ");
 },
 SetText: function (value) {
  this.text = value;
  this.treeView.SetNodeText(this, value);
 },
 GetVisible: function () {
  return this.clientVisible;
 },
 SetVisible: function (value) {
  this.clientVisible = value;
  this.treeView.SetNodeClientVisible(this, this.clientVisible);
 },
 GetHtmlElement: function () {
  return _aspxGetElementById(this.contentElementID);
 }
});
ASPxClientTreeViewNodeProcessingModeEventArgs = _aspxCreateClass(ASPxClientProcessingModeEventArgs, {
 constructor: function (processOnServer, node) {
  this.constructor.prototype.constructor.call(this, processOnServer);
  this.node = node;
 }
});
ASPxClientTreeViewNodeClickEventArgs = _aspxCreateClass(ASPxClientTreeViewNodeProcessingModeEventArgs, {
 constructor: function (processOnServer, node, htmlElement, htmlEvent) {
  this.constructor.prototype.constructor.call(this, processOnServer, node);
  this.htmlElement = htmlElement;
  this.htmlEvent = htmlEvent;
 }
});
ASPxClientTreeViewNodeEventArgs = _aspxCreateClass(ASPxClientEventArgs, {
 constructor: function (node) {
  this.node = node;
 }
});
ASPxClientTreeViewNodeCancelEventArgs = _aspxCreateClass(ASPxClientProcessingModeCancelEventArgs, {
 constructor: function (processOnServer, node) {
  this.constructor.prototype.constructor.call(this, processOnServer);
  this.node = node;
 }
});
