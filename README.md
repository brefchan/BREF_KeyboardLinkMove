# BREF_KeyboardLinkMove
当键盘弹出或消失时,输入框输入也随之运动

- 简介
  模仿微信的聊天界面中,键盘弹出时,输入框所在的视图也随着键盘改变位置,保持可见状态.
  大部分涉及聊天功能的应用中,都可以使用此代码.
  
- 使用方法
  下载完code以后将KeyBoardLinkMoveUtility.h以及.m文件导入工程,并使用这一句代码:
  [[KeyBoardLinkMoveUtility sharedInstance] addObserverWithLinkView:_inputView];
  
