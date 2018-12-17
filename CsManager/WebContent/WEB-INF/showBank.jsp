<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
		<title>极速版卡</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bank/public.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bank/index-new.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bank/swiper.min.css" />
		<link href="<%=request.getContextPath()%>/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/css/style.min862f.css?v=4.1.0" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
		
		
		<style>
			.click_daoliu{
				background: rgba(0,0,0,.85);
				display: block;
				color: #fff;
				height: 2.5rem;
				line-height: 2.5rem;
				padding: 0 .8rem;
			}
			.click_daoliu img{
				width: 1.5rem;
				padding-bottom: .1rem;
			}
		</style>
		


	</head>
	<body>
		<div id="app">
			<div class="banner">
				<div class="swiper-container" id="swiper1">
			    <div class="swiper-wrapper">
			      	<div class="swiper-slide link"  data-src="banner_3">
						<div class="swiper-lazy-preloader swiper-lazy-preloader-black"></div>
			      </div>
			      			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination swiper-pagination-white"></div>
			  </div>
			</div>
			<a href="javascript:;" class="click_daoliu">
				<img src="<%=request.getContextPath()%>/img/bank/img/landing6-daoliu-ico.png" alt="">
				<span>信用卡申请不需要任何费用，谨防电话诈骗</span>
			</a>
			 <!--<div class="nav-list flex flex-pack-start flex-warp"> -->
				<!-- <div class="nav" onclick="jump(this)" data-src='/index/show/bank.html' title="办信用卡">
					<img src="http://xian.0k2sjm.cn/template//index/images/new/banka.png" />
					<p>办信用卡</p>
				</div>  -->
				 <!-- <div class="nav" onclick="jump(this)" data-src='/index/show/daikuan.html' title="贷款">
					<img src="http://xian.0k2sjm.cn/template//index/images/new/daikuan.png" />
					<p>贷款</p>
				</div>  -->
				 <!-- <div class="nav" onclick="jump(this)" data-src='/index/show/wenzhang.html' title='提额技巧'>
					<img src="http://xian.0k2sjm.cn/template//index/images/new/jiqiao.png"  style="width: auto !important;height: 35px!important;padding-top: 0 !important;"/>
					<p style="padding-top: 0 !important;">提额技巧</p>
				</div> 
                  -->
				<!-- <div class="nav"  onclick="jump(this)" data-src='/index/user/zhuanshu.html' title='专属客服'>
					<img src="http://xian.0k2sjm.cn/template//index/images/new/kefu.png" />
					<p>专属客服</p>
				</div> -->

				<!-- <div class="nav" onclick="jump(this)" data-src='/index/show/jindu.html' title='进度查询'>
					<img src="http://xian.0k2sjm.cn/template//index/images/new/jindu.png" />
					<p>进度查询</p>
				</div>-->

				<!-- <div class="nav" onclick="jump(this)" data-src='reg.html' title='登录' v-if="is_login == 0">
					<img src="http://xian.0k2sjm.cn/template//index/images/new/geren.png" />
					<p>登录</p>
				</div> -->
								<!--  <div class="nav" onclick="jump(this)" data-src='/index/user.html' title='用户中心' v-if="is_login == 1">
					<img src="http://xian.0k2sjm.cn/template//index/images/new/geren.png" />
					<p>个人中心</p>
				</div> -->
								 <!-- <div class="nav none">
					<img src="http://xian.0k2sjm.cn/template//index/images/new/none.png" />
					<p>敬请期待</p>
				</div> -->
			 <!--</div>-->
			
			<div class="kuaixun flex flex-align-center flex-pack-start">
				<div class="kuaixun-left">
				    卡卡快讯
				    <img src="<%=request.getContextPath()%>/img/bank/img/kuai.png" />
				</div>
				<div class="kuai-content flex-1">
					<div class="swiper-container flex-1" id="swiper-container2" style="height:1.2rem">
						<div class="swiper-wrapper"  onclick="jump(this)" data-src='/index/show/wenzhang.html'>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>任*博申请了中信银行信用卡 ！额度9.8万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>任*博申请了交通银行信用卡 ！额度5.9万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>任*博申请了招商银行信用卡 ！额度7.8万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>何*波申请了浦发银行信用卡 ！额度3.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>刘*轩申请了中信银行信用卡 ！额度3.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>卢*祥申请了浦发银行信用卡 ！额度10万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>周*伟申请了招商银行信用卡 ！额度5.6万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>周*英申请了浦发银行信用卡 ！额度4.5万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>孙*萌申请了交通银行信用卡 ！额度3.9万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>宁*芬申请了光大银行信用卡 ！额度8.5万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>宁*芬申请了点点现金贷信用卡 ！额度5.4万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>师*的申请了招商银行信用卡 ！额度5.4万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>师*的申请了浦发银行信用卡 ！额度9.8万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>张*力申请了浦发银行信用卡 ！额度5.7万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>张*金申请了光大银行信用卡 ！额度5.6万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>张*金申请了招商银行信用卡 ！额度3.5万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>慕*刚申请了招商银行信用卡 ！额度8.1万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>易*兰申请了浦发银行信用卡 ！额度1.1万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>曹*尧申请了招商银行信用卡 ！额度6.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>曹*本申请了招行标准信用卡信用卡 ！额度8.9万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>曹*飞申请了招行标准信用卡信用卡 ！额度10万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>李*云申请了招商银行信用卡 ！额度4.6万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>李*刚申请了招商银行信用卡 ！额度8.2万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>林*泉申请了光大银行信用卡 ！额度3.1万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>梁*申请了招商银行信用卡 ！额度9.2万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>熊*红申请了招商银行信用卡 ！额度6.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>牟*庆申请了招商银行信用卡 ！额度9.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>王*武申请了招商银行信用卡 ！额度9.4万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>秦*蓉申请了光大银行信用卡 ！额度7.9万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>索*杰申请了招商银行信用卡 ！额度6.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>蒋*艺申请了招商银行信用卡 ！额度3.4万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>袁*敏申请了光大银行信用卡 ！额度4.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>裴*宇申请了浦发银行信用卡 ！额度4.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>裴*花申请了浦发银行信用卡 ！额度5.4万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>许*迎申请了光大银行信用卡 ！额度9.5万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>许*迎申请了浦发银行信用卡 ！额度6.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>谢*群申请了交通银行信用卡 ！额度1.2万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>赵*申请了光大银行信用卡 ！额度2.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>赵*申请了浦发银行信用卡 ！额度2.6万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>赵*龙申请了交通银行信用卡 ！额度5.1万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>郎*申请了中信银行银联标准IC信用卡（金卡）信用卡 ！额度8.6万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>郎*申请了招行标准信用卡信用卡 ！额度1.6万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>郭*虎申请了中信银行信用卡 ！额度7.7万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>郭*虎申请了交通银行信用卡 ！额度8.5万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>隋*生申请了中信银行信用卡 ！额度7.8万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>韦*文申请了交通银行信用卡 ！额度6.8万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>高*全申请了光大银行信用卡 ！额度3.7万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>高*申请了交通银行信用卡 ！额度1.3万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>黄*柳申请了中信银行信用卡 ！额度5.7万</span>
								</div>
								<div class="swiper-slide swiper-no-swiping flex flex-pack-start flex-align-center">
									<span>龙*容申请了中信银行信用卡 ！额度2.6万</span>
								</div>
							</div>
					</div>
				</div>
			</div>
			<div class="card-list flex flex-pack-start flex-warp">
				<div class="title flex flex-align-center flex-pack-justify">快速办卡
				<!-- <div class="more">更多</div> -->
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_20'>
					<div class="logo">
						<img src="../bank_ico/cmb.png"/>
					</div>
					<div class="bank-name">
						招商银行					
					</div>
					<!--<p></p> -->
					<div class="desc">
						高额					
					</div>
					 <div class="btn btn-info btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_3'>
					<div class="logo">
						<img src="../bank_ico/ceb.png"/>
					</div>
					<div class="bank-name">
						光大银行					
					</div>
					<!--<p>10元洗靓车，嗨购京东，满100减30元</p> -->
					<div class="desc">
						秒批					
					</div>
					<div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_4'>
					<div class="logo">
						<img src="../bank_ico/spdb.png"/>
					</div>
					<div class="bank-name">
						浦发银行					
					</div>
					<!--<p>免年费，送4888刷卡金</p> -->
					<div class="desc">
						秒批					
					</div>
					<div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_5'>
					<div class="logo">
						<img src="../bank_ico/bcm.png"/>
					</div>
					<div class="bank-name">
						交通银行					
					</div>
					<!--<p>周五加油享5%优惠</p> -->
					<div class="desc">
						高额					
					</div>
                    <div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_9'>
					<div class="logo">
						<img src="../bank_ico/cncb.png"/>
					</div>
					<div class="bank-name">
						中信银行					
					</div>
					<!--<p></p> -->
					<div class="desc">
						秒批					
					</div>
					<div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_41'>
					<div class="logo">
						<img src="../bank_ico/360.png"/>
					</div>
					<div class="bank-name">
						360借条					
					</div>
					<!--<p></p> -->
					<div class="desc">
						秒批					
					</div>
					<div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_38'>
					<div class="logo">
						<img src="../bank_ico/diandian.png"/>
					</div>
					<div class="bank-name">
						点点现金贷					
					</div>
					<!--<p></p> -->
					<div class="desc">
						高额					
					</div>
					<div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_39'>
					<div class="logo">
						<img src="../bank_ico/youyidai.png"/>
					</div>
					<div class="bank-name">
						又一贷					
					</div>
					<!--<p></p> -->
					<div class="desc">
						高额					
					</div>
					<div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
				<div class="card flex flex-align-center flex-pack-center flex-warp link"  data-src='bank_40'>
					<div class="logo">
						<img src="../bank_ico/kuaidai.jpg"/>
					</div>
					<div class="bank-name">
						快贷					
					</div>
					<!--<p></p> -->
					<div class="desc">
						高额					
					</div>
					<div class="btn btn-default btn-circle asc" style="width:20px;height:20px;padding:1px 0;">
					     <i class="fa fa-check"></i>
                     </div>
				</div>
			</div>

			<div class="xia">
				<div class="title flex flex-align-center flex-pack-justify">下卡排行
				<!-- <div class="more">更多</div> -->
				</div>
				<div class="list flex flex-pack-start link" data-src="bank_28">
					<div class="bank">
						<img src="<%=request.getContextPath()%>/img/bank/creditcard/f749c0f294704d69ccae0374b26a56c6.png" />
						<!-- <div class="bank-desc flex flex-align-center flex-pack-start">
							<i class="xz-icon"></i>
							3354774用户选择
						</div> -->
					</div>
					<div class="xia-content  box flex-1">
						<div class="content-top">
							<i class="line"></i>
							<p>招行标准信用卡</p>
							<i class="line"></i>
						</div>
						<div class="xia-desc">
							
						</div>
						<p class="tip">无抵押借款最高30万元,新户刷卡礼送1000积分。快速发卡！</p>
					</div>
				</div>
				<div class="list flex flex-pack-start link" data-src="bank_19">
					<div class="bank">
						<img src="<%=request.getContextPath()%>/img/bank/creditcard/51ff0f445ae69ec8547fbf72f7dad390.jpg" />
						<!-- <div class="bank-desc flex flex-align-center flex-pack-start">
							<i class="xz-icon"></i>
							3354774用户选择
						</div> -->
					</div>
					<div class="xia-content  box flex-1">
						<div class="content-top">
							<i class="line"></i>
							<p>交通银行标准银联金卡</p>
							<i class="line"></i>
						</div>
						<div class="xia-desc">
							
						</div>
						<p class="tip">每周五超市、加油乐享5%优惠,【新手5分购】达标兑缤纷好礼</p>
					</div>
				</div>
				<div class="list flex flex-pack-start link" data-src="bank_16">
					<div class="bank">
						<img src="<%=request.getContextPath()%>/img/bank/creditcard/0f34535d916e5ab14c897ab9a1a95e62.png" />
						<!-- <div class="bank-desc flex flex-align-center flex-pack-start">
							<i class="xz-icon"></i>
							3354774用户选择
						</div> -->
					</div>
					<div class="xia-content  box flex-1">
						<div class="content-top">
							<i class="line"></i>
							<p>中信银行银联标准IC信用卡（金卡）</p>
							<i class="line"></i>
						</div>
						<div class="xia-desc">
							
						</div>
						<p class="tip">中信首张IC芯片卡,2小时最高1000元航班延误险</p>
					</div>
				</div>
							</div>
			<div class="bottom-nav flex flex-pack-start" style="display: none;">
				<div class="bottom-list flex flex-pack-center flex-align-center flex-warp banka on">
					<i class="bottom-list-icon"></i>
					<p>我要办卡</p>
				</div>
				<div class="bottom-list flex flex-pack-center flex-align-center flex-warp daikuan">
					<i class="bottom-list-icon"></i>
					<p>我要贷款</p>
				</div>
				<div class="bottom-list flex flex-pack-center flex-align-center flex-warp center">
					<i class="bottom-list-icon"></i>
					<p>个人中心</p>
				</div>
			</div>
		</div>
	  <script src="http://xian.0k2sjm.cn/template//index/js/jquery.min.js"></script>
	  <script src="http://xian.0k2sjm.cn/template//index/js/swiper.min.js"></script>
	  <script src="http://xian.0k2sjm.cn/template//index/js/common.js"></script>
	
	  <!-- Initialize Swiper -->
	  <script>
	    var swiper = new Swiper('#swiper1', {
	      lazy: true,
	      //loop:true,
	      pagination: {
	        el: '.swiper-pagination',
	      },
	    });
	    var swiper2 = new Swiper('#swiper-container2', {
								direction: 'vertical',
								loop: true,
								autoplay: {
									delay: 2000
								},
							});
	    
	    $(".close").on('click',function(){
	    	$(".wan").animate({height:"0",opacity:"0"},200);
	    });
	  </script>
	</body>
</html>
