# plalertsmanager

自定义弹窗管理类，使用队列来进行管理。

前一个弹窗消失后，下一个弹窗会自动弹出，保证当前有且只有一个弹窗在展示。
在所有弹窗消失后，会有完成的回调。

暂不支持系统弹窗和设置弹窗优先级。现遵循先进先出原则。

水平有限，如有错误，还请各位大神不吝赐教。
