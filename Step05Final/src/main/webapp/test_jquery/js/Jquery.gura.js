(function($){
			$.fn.gura=function(options){
				//defalut값 정의
				let setting = $.extend({
					msg:"i'm plugin",
					color:"red"
				}, options);
				//이 안에서 this는 $()함수를 이용해서 선택된 객체
				this.text(setting.msg).css("color", setting.color)
				//체인 형태로 동작이 가능하도록 this를 리턴
				return this;
			};
})($);