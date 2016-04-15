function openExchangeGoodDetail(goodId){
		var _goodId = goodId;
		$.fancybox({
			href:"",
			width:800,
			type:'iframe',
			title:"交换物品的详细信息",
			height:500,
			autoDimensions:false,
			autoScale:true,
			overlayOpacity:0.9,
			transitionIn:'elastic',
			padding:5,
			margin:0});
	}