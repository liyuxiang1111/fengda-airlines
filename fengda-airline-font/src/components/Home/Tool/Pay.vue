<template>
  <div class="pay-contaienr">
    <Topbar></Topbar>
    <div class="pay-box w clearfix">
      <Top></Top>
      <div class="payment-box fl">
        <div class="payment-top">订单信息</div>
        <div class="sub-title">乘机人信息</div>
        <div class="passengers">
          <div class="passenger">
            <p class="aut">乘机人信息</p>
            <td>
              姓名：<span>{{ $store.state.menberName }}</span>
            </td>
            <td>
              证件信息：<span>{{ $store.state.certificate }}</span>
            </td>
            <td>
              手机号码：<span>{{ $store.state.telephone }}</span>
            </td>
            <td>
              邮箱：<span>{{ $store.state.email }}</span>
            </td>
          </div>
        </div>
        <div class="sub-title">法律以及条款：</div>
        <div class="tab">
          <div class="current" v-html="html"></div>
          <el-checkbox class="law" v-model="checked"
            >已阅读并同意以上法律及服务条款</el-checkbox
          >
        </div>
        <div class="button-box">
          <div class="back fl button" @click="back">重新选择</div>
          <!-- <div class="next fr button" @click="next">下一步</div> -->
          <button class="next fr button" @click="next" :disabled="!checked">
            下一步
          </button>
        </div>
      </div>
      <div class="swiper-box fr">
        <Swiper></Swiper>
        <div class="tip">
          <div class="title">注意事项：</div>
          <p>
            1.预订价格可能发生变动，请以实际价格为准！
            2.所有航班起抵时间均为当地时间（24小时制），请注意安排行程。
          </p>
        </div>
        <div class="advertisement">广告位招租</div>
      </div>
    </div>
  </div>
</template>

<script>
import Topbar from "@/components/Home/Tool/Topbar.vue";
import Top from "@/components/Home/Order/Top.vue";
import Swiper from "@/components/Home/Swiper.vue";
export default {
  created() {
    console.log("store" + this.$store.state.menberName);
    this.passengerName = this.$store.state.menberName;
    this.certificate = this.$store.state.certificate;
    this.telephone = this.$store.state.telephone;
    this.email = this.$store.state.email;
    this.certificateType = this.$store.state.certificateType;
  },
  data() {
    return {
      certificateType: "",
      payId: "",
      passengerName: "",
      certificate: "",
      telephone: "",
      email: "",
      checked: "",
      html: '<p>&nbsp&nbsp&nbsp&nbsp&nbsp 1、影响飞行安全的危险天气风切变</p><p>风切变是在短短距离内风向、风速发生明显突变的状况。强烈的风切变瞬间可以是飞机过早的或者被迫复飞。在一定条件下还可导致飞机失速和难以操纵的危险，甚至导致飞行事故。</p><p>　　2、航空公司和航班号的对应关系是什么？</p><p>　　航班号的组成分为两个部分：（1）航空公司号；（2）班次。</p><p>　　在民航运输和空中交通管制两个工作领域都涉及到航班号，但表达有所不同，主要在航空公司号部分。</p><p>　　如CSN3101，在机票上表示为CZ3101&mdash;&mdash;中国南方航空公司3101航班。</p><p>　　3、什么是国际航协？</p><p>　　国际航协是一个由全世界各国航空公司于1945年组建的大型民间组织，总部设在加拿大的蒙特利尔，执行总部在瑞士日内瓦。目前，国际航协会员航空公司逾200个，遍布30个国家。在世界定期<a href="https://china.findlaw.cn/info/hangkongfa/gjhkys/" target="_blank">国际航空运输</a>业务中，会员航空公司占了98%。</p><p>　　4、怎样知道我的航班降落在上海哪个机场？</p><p>　　请注意您的机票，往浦东机场的目的机场代号是PVG，往虹桥机场的是SHA，所以请有这方面疑问的旅客注意了，千万不要让家人接错机场。</p><p>　　5、国际机票税从何来？</p><p>　　购买国际机票的旅客经常会问，为什么买机票还要交税，是机场建设税吗？当然不是。购买国际机票时出现的税，是航空公司代当地国家政府收的税。</p><p>　　国际机票的税大致分为三种：离境税、过境税、入境税个别国家还有其他名目的税。例如美国，除了有上述税以外，还有海关使用税、机场税、动植物免疫检查费等。</p><p>　　当然有些国家是不收税的，像中国、菲律宾等国家是不收税的。所以，如果你从中国去日本，单程没有税，但是往返则有税；或者你从日本出发回中国的单程机票是有税的，那是因为中国没有出境税，日本没有入境税，但日本有离境税。</p><p>　　税一般根据购买机票时的汇率发生变化，这就是为什么上次购买机票和这次购买机票航程一样、税却不同的原因。当然相差的比率并不大。</p><p>　　在一些国家，有的城市有税，有的城市没有税，例如日本的东京、大阪有离境税，而札幌则没有税。</p><p>　　6、什么叫&ldquo;中转服务&rdquo;？</p><p>　　中转服务是民航针对购买联程机票的旅客而开展的空地一条龙服务。从售票这一环节开始，每个部门都会把中转旅客的姓名、人数，换乘航班情况通知后续部门。中转旅客到达换乘机场后，只要在到达大厅找到中转服务柜台，便会有专人协助其提取行李、办理后续航班登机手续。通过安检。</p><p>　　中转旅客是航空公司的重要客源。在竞争日趋激烈的今天，谁能将不同航线上的城市连接成线，谁就能最大限度地占领航空运输市场，开展中转服务的航空公司航线网络发达、航班密集，可以最大限度地发挥航空运输方便、快捷的优势。</p><p>　　中国南方航空公司于1996年下半年率先在广州全面实施中转服务，为旅客提供国际航班转国际航班、国际航班转国内航班、国内航班转国际航班、国内航班转国内航班服务，从而成为国内首家能提供这四种中转服务的航空公司。</p><p>　　中国东方航空公司则在1996年推出了&ldquo;穿梭中国&rdquo;中转服务，为乘坐东航国际航班转接东航国内航班的旅客带来了很大方便。1997年4月，东航同美国美利坚航空公司开始合作，推出上海经洛杉矶到纽约，芝加哥，达拉斯，华盛顿4座城市的&ldquo;联程直达&rdquo;服务，后来又将&ldquo;穿梭中国&rdquo;与&ldquo;航程直达&rdquo;两项服务贯穿起来。</p><p>　　继&ldquo;南航中转&rdquo;，东航&ldquo;穿梭中国&rdquo;特色服务之后，我国许多航空公司都推出了中转服务。这一服务受到广大旅客的欢迎，汉1998年就有8万名旅客享受了南航中转服务。截至目前，享受东航&ldquo;穿梭中国&rdquo;服务的旅客已超过10万人。</p><p>　　7、什么叫中性机票（BSP）？</p><p>　　BSP（BillingandSettlementPlan），简称BSP，即开账与结算计划，它是国际航协根据运输代理业的发展和需要而建立，供航空公司和代理人之间使用的销售结算系统。</p><p>　　BSP中性票就是由国际航协认可的代理人出售的统一规格的票证；它将代替以前由各家航空公司印制的机票。</p><p>　　BSP中性票由代理人销售，并通过国际航协指定的数据处理中心和清算银行进行结算和付款，从而避免了以往航空公司和代理人之间多种票证、多头结算、多次付款的复杂状况，为航空公司和代理人节约了大量开支，提高了工作效率和服务质量，也杜绝了欺诈等违规行为。据悉，迄今世界上已有280多家航空公司和4万余家代理人参与BSP的运作。</p><p>　　1996年4月，中国民航总局召开会议，要求国内一二类机票代理人尽快使用BSP中性票为航空公司销售。随后，以国航为代表的21家航空公司也联合致信国内代理人，声称将收回本公司的机票，敦促他们尽快使用BSP中性票。</p><p>　　如今，北京地区的代理人已全部使用中性票，其他主要城市的代理人也正逐步用统一规格的中性票代替以往五颜六色的各航空公司的机票，那么旅客从代理人手中拿到的中性票是什么模样的呢，它们是以蓝底红色世界地图为封面的国际客票，以白底红色中国地图为封面的国内客票，机票上统一印有国际航协（IATA）标志。</p><p>　　8、什么叫&ldquo;代号共享&rdquo;？</p><p>　　代号共享（code-sharing）是指一家航空公司的航班号（即代号）可以用在另一家航空公司的航班上。这对航空公司而言，不仅可以在不投入成本的情况下完善航线网络、扩大市场份额，而且越过了某些相对封闭的航空市场的壁垒。</p><p>　　对于旅客而言，则可以享受到更加便捷、丰富的服务，比如众多的航班和时刻选择，一体化的转机服务、优惠的环球票价，共享的休息厅以及常旅客计划等等。</p><p>　　正因为代号共享优化了航空公司的资源，并使旅客受益匪浅，所以它于70年代在美国国内市场诞生后，短短20年便已成为全球航空运输业内最流行的合作方式。我国的三大骨干航空公司也已于近两年分别与三家主要的美国航空公司签署了代号共享协议，他们是，中国国际航空公司与美国西北航空公司、中国东方航空公司与美利坚航空公司、中国南方航空公司与三角航空公司。</p><p>　　其中，国航与美西北航的代号共享开始得最早，始于1998年5月，合作的层次最深，领域最广。双方不仅联接了订座和离港系统，互通了常旅客项目，联合销售和促销，而且真正实现了&ldquo;通程登机&rdquo;和&ldquo;无缝隙&rdquo;服务，旅客在始发机场办理登机手续时即可一次拿到途中所有航班的登机牌，行李也可被直接运至目的地。今后，双方的合作领域将进一步扩大到培训、财务和人事管理等方面。</p><p>　　&ldquo;代号共享&rdquo;这种方式使中国的航空公司得以直接吸取国外先进航空公司在经营和管理上的经验，尽快融入日益全球化、自由化的航空运输业。</p><p>　　9、何时从日本飞回家合算？</p><p>　　在日本，生活是非常现实的，手中不多的钱如何合理使用，发挥最大的实效是每个留学生都必须考虑的问题，尤其是在回国时间的选择上。</p><p>一般而言，一年中机票的价格是随旅游的淡旺季、季节和各航空公司的不同而波动。完全按照市场的供求关系来定位。以日本为例，一年之中，1、2月份由于寒冷为旅游淡季，又处于新年的大肆消费后，人们普遍手头紧，各航空公司纷纷降价促销，此时的票价最低，是平时的1/2至1/3。相反，每年5月初的&ldquo;黄金周&rdquo;（goldenweek）和8月中的于兰盆节，因为有全国性的连休，机票价格在短时间内猛涨。在选择航空公司方面，例如全日空（ANA），日本航空（JAL）等著名航空公司的机票价格会比其他航空公司的票价略高。美国西北航空公司（NW）是以廉价机票而著称的。当然以上这些都是指经济航（EconomicClass）而言。如果是公务航（BusinessClass）或头等航（FirstClass），哪一家航空公司的机票都是价格不菲。</p><p>　　确定在最低价位的时间回国探亲，恰逢我国的春节，是亲友们团聚的良机，远方游子的归来更能为家庭增加节日的气氛。</p><p>　　10、在什么条件下旅客的免费行李额可以合并计算？</p><p>　　搭乘同一飞机前往同一目的地或中途分程地点的二个或二个以上同行旅客或团体旅客，不论他们是否乘同一等级的座位，如同时在同一地点交运行李，其免费行李额可按人数和票价座位级别合并计算。</p><p>　　11、国际航线旅客每人可免费携带哪些随身物品？</p><p>　　一个女用手提包，一件大衣或雨衣或一条旅行用的毛毯，一把伞或一根手杖，一个小型照相机，一具小型望远镜，在飞行途中需要阅读的少量读物，在飞行途中需用的婴儿食品，一个婴儿摇篮，旅客赖以行动的折叠椅或一付拐杖或撑架或假肢。</p><p>　　12、国际航线的免费行李额有什么规定？</p><p>　　国际航线免费行李额分为计重免费行李额和计件免费行李额两种。计重免费行李额；按照旅客所付的票价座位等级，每一全票或半票旅客免费行李额为：一等舱为40公斤（88磅），公务舱为30公斤（66磅），经济舱（包括旅游折扣）为20公斤（44磅），按成人全票价百分之十购票的婴儿无免费行李颔。计件免费行李额，按照旅客所付的票价座位等级，每一全票或半票旅客的免费行李额为两件，每件长、宽、高三边之和不得超过158厘米（62时），每件重量不得超过32公斤。但持有经济舱（包括旅游折扣）客票的旅客，其两件行李长、宽、高的总和不得超过273厘米（117时），按成人全票价百分之十购票的婴儿无免费行李额。</p><p>　　同时，随着民航的发展，不同的航空公司、不同的航线对免费行李的要求也不一样，各位在订购机票时，一定要看清楚机票上的免费行李的规定，并问清售票处工作人员应注意事项。实际上，只要你的行李大小能够放在飞机座位上的行李箱内，承运人一般不会去检查重量的。</p><p>　　告戒，中加航线千万不要超重，更不要超件，愈重费常常是成倍的增长。如果实在超重，作为货物托运也比付超重行李费要便宜，各位要切记。</p><p>　　13、何为&ldquo;鸳鸯票&rdquo;（阴阳票）？</p><p>　　通俗他说,&ldquo;鸳鸯票&rdquo;就是机票的乘机联与财务联票额不符。乘机联上的票额是代理人实收的票额，财务联上的票额是航空公司实收的票额，两者本来应该一致，但由于代理人做了手脚，造成乘机联票额大于财务联票额，两者之差就是代理人从中渔利侵占航空公司的票额。</p><p>　　代理人填开&ldquo;鸳鸯票&rdquo;主要有三种形式，一是利用成人票与儿童票、婴儿票价格之差；二是利用经济舱与头等舱价格之差；三是利用航段长短的价格之差。一张&ldquo;鸳鸯票&rdquo;，代理人从中渔利少则几百元，多则上千元，不仅使航空公司在经济上直接受损，还可能造成航空公司座位的虚耗（比如利用航段不同填开&ldquo;鸳鸯票&rdquo;），从而侵占航空公司和旅客的双重利益。</p><p>　　14、何为&ldquo;精品航线&rdquo;？</p><p>　　精品航线是民航总局1996年12月决定在全行业创建的精品服务样板类型之一。当时提出的精品航线共有6条：北京一广州、北京一上海，北京一香港、北京一法兰克福、上海&mdash;洛杉矾、广州一新加坡。</p><p>　　在这6条精品航线上，每周共有397个航班，占全民航每周航班总数的4%。有幸乘坐这些航班的旅客都会发现，航班上的乘务组均为各航空公司的优秀示范乘务组，机舱的硬件设施、服务水准都达到了国内一流水平。因为，精品航线上飞行的航班都必须达到文明航班的要求。文明航班也是民航总局树立的精品服务样板类型之一。</p><p>　　在精品航线上飞行的航班除了客舱服务旅客满意率必须达到95%外，还必须达到以下标准：飞行和空防安全事故为零，航班正常率达到90%，行李运输差错率不超过万分之一。在创建过程中，各航空公司从严要求，均达到甚至超过了这个标准，从而大大推进了民航整体服务水平的提高。</p><p>　　凡是承担精品航线航班飞行任务的航空公司，均使出浑身解数，一时间一批&ldquo;名特优新&rdquo;的服务品牌纷纷在航班上登台亮相，如&ldquo;空中生日&rdquo;、&ldquo;特殊旅客服务卡&rdquo;、&ldquo;空中早茶&rdquo;等等，使航班服务的内容更加丰富多样，真正做到了无微不至、宾至如归。各航空公司把精品航线的特色服务推展到其他航线，使精品意识深入人心，&ldquo;服务于旅客开口之前&rdquo;的主动服务、&ldquo;于细微处见真情&rdquo;的精细服务、&ldquo;心系老幼病残孕旅客&rdquo;的特殊服务、&ldquo;为旅客排忧解难&rdquo;的延伸服务等等，构成了精品服务的丰富内涵。</p><p>　　15、为什么提前30分钟停办乘机手续？</p><p>　　在办完乘机手续后到飞机滑行到跑道头的30分钟内，民航工作人员要进行三个方面的工作：</p><p>　　一、值机人员要结算旅客人数，行李数件、重量、货物件数、重量、邮件等，并根据以上数据进行载重平衡的结算（载重平衡结算要画平衡图，计算重心位置），然后做好舱单，送上飞机交机组，飞机方可放行，这些工作大约需要15分钟左右；</p><p>　　二、在进行上述工作的同时，广播室通知旅客开始登机，服务员要核对登机牌，清点人数。旅客上了飞机后，乘务员要再次清点人数，防止有人漏乘，然后进行飞机起飞前的准备工作，给旅客讲解有关注意事项和机上设备使用方法，检查行李架上的行李是否放好，旅客的安全带是否系好等工作。搬运队还要往机舱内装行李、货物、邮件，以上工作虽是同步进行，但全布完成需要20分钟；</p><p>　　三、剩下10分钟是飞机关好舱门滑行到跑道起始点所需的时间。所以飞机离开地面30分钟应停办乘机手续，否则航班就会延误。</p><p>　　16、为什么旅客误机时要将其行李卸下后飞机才能起飞？</p><p>　　根据中国民用航空公司的有关规定，当旅客购买了机票后，旅客就和某一航空公司<a href="https://china.findlaw.cn/info/hy/jichengfa/jichengren/" target="_blank">继承人</a>产生了一种契约关系。承运人有责任而且应该将旅客运送到目的地，包括旅客所托运的行李。如果在航空运输期间，旅客所交运的行李发生毁灭、遗失或损坏，则承运人应承担相应的责任。因此，当发生旅客由于某种原因而误机时，为了对旅客负责，航空公司须将该旅客所交运的行李从飞机上卸下，才让飞机起飞，以免发生旅客在甲地，而行李在乙地，从而给旅客的工作、生活带来不便的情况。</p><p>　　同时，这也是保证航空运输安全的一种措施。国外曾发生过旅客将危险物品交运后，故意误机而引起航空运输事故的事件。所以，从飞机上卸下误机旅客的行李，也是为了保证广大旅客的安全。</p><p>　　17、飞机在跑道上滑行时为什么会出现摇晃？</p><p>　　这是正常现象。其原因主要是因为跑道不够平坦，有时是因为飞机刹车所致。不过这种情况没什么影响，就像乘坐公共汽车也会发生摇晃现象一样。况且飞机主要是为飞行而不是为滑行而设计的。</p><p>　　18、飞机起飞后不久，为什么会听到轰隆的噪声？</p><p>　　这是飞机收起落架和襟翼时产生的声音。飞机起飞后，大约在10米的高度上（这一高度因飞机的不同而异），驾驶员将起落架和襟翼收起，以提高飞机的空气动力性能，使飞机更快的爬升。如果旅客坐在客舱中央和靠近机翼处，就会听的更加清楚。</p><p>　　19、飞机起飞后，发动机的速度似乎减慢了，为什么？</p><p>　　这是驾驶员进行正常操作所产生的的现象。飞机爬到300米（1000英尺）左右的高度时，驾驶员减小油门，降低发动机的功率，因为这时的飞机已不需要在起飞时那样大的推动了，同时还能减小发动机噪声对机场的影响。对飞越城市上空的飞机所产生的噪音标准，各国都有明确的规定，必须严格遵守。</p><p>　　20、飞机起降为何选择逆风而行？</p><p>　　飞机的起飞和着陆，应尽量选择逆风而行，因为逆风起降可以增加升力或阻力使飞机的离地速度</p><p>　　或着陆速度减少，因而能缩短飞机的起飞滑跑距离或着陆距离，同时迎风起降还有利飞机运动中的方向稳定性和操纵性，比较安全，由于飞机起飞和着陆时的速度比较慢，稳定性差，如遇强劲的侧风就会把飞机吹歪倾斜，所以一般说来，只有在无法选择逆风条件而且跑道长度足够的条件下才可以顺风着陆。不过现在的飞机速度、重量及稳定性都比过去的飞机有很大的改进和提高，风向对飞机的起落影响减小了。</p><p>　　21、何为正常航班？</p><p>　　一个正常航班包括三个要素：一是在公布的离站时间以前关好机门，二是在公布的离站时间后1分钟内起飞，三是在公布的到达站时间正常着陆。任何航班只要不符合三个条件中的一条就为不正常航班。有些人认为航班起飞超过班期时刻表上公布的离站时间就为延误航班，这种理解是不正确的。按照国际惯例，飞机在公布时间后15分钟内起飞，均为正场航班。比如，北京飞上海的航班，班期时刻表上公布的离站时间为20：10，而飞机只要在20：25以前起飞，就算正常起飞的航班。</p><p>　　22、飞机为何有时要复飞？</p><p>　　复飞，是保证飞行安全的措施之一，而复飞的原因是多种的：有的是因机场有障碍，有的是因为飞机本身有故障，更多的原因是天气坏，能见度低等。因为飞机着路，有一个决断高度，当飞机下降到此高度时，驾驶员认为不具备着路条件，就要加打油门，重新把飞机拉起复飞，然后再次进行着陆......多次复飞，驾驶员如觉得不能达到着陆的要求时，为了安全，飞机就要改落备降机场了。</p><p>　　23、为什么晴空也会有颠簸？</p><p>　　经常乘坐飞机的人都知道，飞机进入云层后会有颠簸产生，特别是在淡积云、强雨区中颠簸尤为强列，但在晴空飞行时比较平稳。但在晴空万里的蓝天中，有时也会向平靖的海面下藏有暗流一样，偶尔会出现强烈的忧动气流，使飞机产生强烈颠簸，即&ldquo;晴空颠簸&rdquo;。它一般产生在7000米以上的高空，宽约100公里、厚约1000米的范围内。这种颠簸虽然不可能造成恶性飞行事故，但机组处理不当，也可以造成旅客重伤，甚至危机人身安全。在飞机遇到晴空颠簸时，机组回采取措施脱离颠簸区，乘客则需留意坐椅上方&ldquo;系好安全带&rdquo;的提示灯，灯亮时，及时系好安全带，以防意外。</p><p>　　24、出门乘机&ldquo;窍门多&rdquo;</p><p>　　尽可能购买来回程机票或者联程机票。现在各地的民航售票处和大部分代理点基本都以实现电脑联网，可订购并预售全国各地始发以及来回程机票。因此您得计划是来回程或多航程，您就应该在买票的同时订好联程机票。民航总局规定，凡在72小时以内的联程机票（包括来回程）不需到当地的售票处去证实，可省去异地在购票的许多麻烦。但是如果您持有的但是如果您持有的是超过72小时的联程机票，则必须提前3天到当地的售票处（部分有证实业务的代理点也行）去对机票进行确认（现北京、上海、广州三地的售票处可用电话证实）。否则您的座位就会被取消，给旅行带来不便。</p><p>　　及时办理退票。旅客如果临时决定取消原定航班，应尽快去原购票处办理退票。飞机离站时间24小时以前办理退票手续的，将不扣除退票费；由于旅客原因，在飞机离站之前2小时至24小时以内申请退票的扣机票款的10%；在飞机离站时间前2小时以内的扣20%。飞机起飞后再退票，扣50%（以上退票均不退保险）。如果由于民航方面的原因，如飞机故障、天气恶劣等造成的航班取消，旅客应及时找机场值机等有关部门办理退票手续或请他们在机票上签字、盖章并说明情况，再去指定的地方办理全额退票。</p><p>　　购票时挑选所乘飞机的机型、航班和所属航空公司。目前国内执行航班任务的飞机机型主要有美国的波音、麦道、法国的空中客车，英国的BAE146，国产的运七等飞机。所属航空公司可从航班代码中得到了解，如国航为CA，东航为MU等。提前一个半小时到达机场，办理乘机手续，领取登机牌。民航总局明文规定，为了保证航班正点和安全，航班起飞前半个小时停止办理乘机手续。</p><p>　　遇变不慌，及时找机场有关部门反映。旅客旅行过程中难免会遇到飞机故障、天气恶劣等造成的航班延误或取消，如果旅客有急事或影响下一航程的飞行，应及时向机场值机室或值班领导反映，请求他们给予帮助。飞机到达目的地后，搭乘民航班车。国内不论大小机场在每个航班到达后，均有民航班车接送旅客去当地的市中心。旅客每次坐民航班车去当地市中心再中转去目的地一般比较经济、方便。</p><p>　　25、什么是正班、加班、包机飞行？</p><p>　　按照规定的航线，定机型、日期和时刻的运输飞行为正班飞行，又称班期飞行，是各航空公司经营的主要形式。根据临时性需要，在正班运输机以外增加的运输飞行，称加班飞行。包机飞行是指包机单位提出申请，经承运人同意并签定包机合同，包用航空公司的飞机，在固定和非固定的航线上，按约定的起飞时间、航程、载运旅客及货物等的飞行。包机类型有普通包机飞行、专机飞行、急救包机飞行、支农包机飞行、旅游包机飞行等。</p><p>　　26、飞机着陆机场上空突然出现雷雨怎么办？</p><p>　　驾驶员从气象雷达和无线电联络中可以预先得知所去机场的气象条件。如果该机场为雷雨天气，飞机可以到备降机场降落。由于雷雨通常为阵雨，所以也可以在空中等待，雷雨过后，再进场着陆。根据飞行计划，飞机上都装有一定的备用燃油，足以保证飞机飞到备降机场或空中至少飞行45分钟。</p><p>　　27、不要马虎对待&ldquo;旅客订座单&rdquo;</p><p>　　旅客订座单是旅客购票和民航据此提供服务的重要依据。它必须由旅客本人填写，并对所添的姓名、证件号码、国籍、工作单位和联系电话等内容的准确性负责。机票销售人员应对&ldquo;旅客订座单&rdquo;，认真核对。如果马虎对待&ldquo;旅客订座单&rdquo;，就会出现给旅行带来麻烦的事。一次，一位旅客把联系电话写错一个数字，碰巧所乘航班变更，售票人员反复打电话却联系不上，结果一行三人未能及时成行；还有两位去西安的旅客不知为什么在&ldquo;航程&rdquo;栏里写上沈阳，办理手续时方才发现，赶紧更改，差点误机；而机票销售人员也因把&ldquo;惠阳&rdquo;听成&ldquo;贵阳&rdquo;而不得不自掏腰包打的去机场追赶购票人，在航班起飞前避免了一起严重的售票差错，所以，请您善待&ldquo;旅客订座单&rdquo;。</p><p>　　28、民航机票退票规定</p><p>　　旅客购票后因故不能成行，可到购票处办理退票。退票时，除凭有效客票外，还要提供本人的有效<a href="https://www.findlaw.cn/138400/" target="_blank">身份证</a>件，在航班离站规定时间24小时之前要求退票，收取的退票费由各航空公司自行决定，但最高不得超过机票价格的10%；在航班离站规定时间24小时以内，2小时之前退票，收取客票价10%的退票费；在航班离站规定时间2小时以内退票，收取客票价20%的退票费；在航班离站规定时间后退票按误机处理。如因航班取消、提前、延误、航程改变或承运人不能提供原定座位时，旅客要求退票，始发站应退还全部票款，经停地应退还未使用航段全部票款，均不收取退票费。</p><p>　　29、民航对变更客票如何规定？</p><p>　　旅客购票后，如要求改变航班、日期、舱位等级应在原指定航班飞机规定离站时间48小时前提出，变更舱位等级，票款多退少补。客票只能变更一次，再次变更，须按退票有关规定办理后，重新购票。但由于乘运的航空公司的航班取消、提前、延误、航程改变或不能提供原订座位时，该航空公司应尽可能优先安排旅客乘坐后续航班，或为其签转其他航空公司的航班；如因上述原因，旅客的舱位等级也需变更时，票款的差额，多退少补。</p><p>　　30、飞机误入雷区会有危险吗？</p><p>　　飞机在9146米（3000英尺）以上的高空飞行时，一般不会遇上雷雨。雷雨区的分布范围一般在几千米以下的积雨云区，飞机在接近雷雨区时会发生颠簸现象，如果误入雷雨区，驾驶员应尽快操纵飞机离开雷雨区，绕道而行，对飞机来说，雷雨区不是久留之地。为防止飞机遭雷击，飞机上装有防雷电装置，它一般安置在机翼的翼尖处，亦叫&ldquo;放电刷&rdquo;。飞机遭到雷击后，电流可以从&ldquo;放电刷&rdquo;中放出去，&ldquo;放电刷&rdquo;即起避雷针的作用。所以尽管舷窗外雷声滚滚、电光闪闪。但飞机安然无恙。旅客门尽可放心。特别是现代打中型飞机一般都装有气象雷达，加上地面的气象预报和驾驶员的正确操纵，绕过雷雨区和迅速脱离雷雨区是容易做到的。</p><p>　　31、飞机在机场上空放掉燃油会带来危险吗？</p><p>　　不会。由于多种原因造成飞机不能继续飞行或着陆困难，特别是迫降时，飞机应在空中放掉燃料，在每个机场上空周围都设有应急放油的空域。放油高度一般在300米以上的空间，这样燃油在落到地面之前，早已在空中全部挥发掉了，不会因此而引起火灾。放油的目的是减轻飞机的重量和减少不安全因素保证安全着陆。</p><p>　　32、怎样购到经济实惠的机票？</p><p>　　眼下民航发展比较快，中国民航成立了30余家航空公司，这些公司经营着所有国内的航线。如果您购买国际机票，更有必要多走几家航空公司，因为同样一条国际航线有几家公司在经营，有中国民航和外国民航，价格有时会相差很大，而且线路也不同，更需要进行比较。现在外国民航几个主要的航空公司在北京均设办事处，这就大大方便了广大旅客。</p><p>　　33、飞机为什么没有降落伞？</p><p>　　常坐飞机的人会发现，飞机上不配备降落伞，乘客没有，机组人员也没有。这是因为如果每个乘客都配备一顶降落伞，就会大大增加飞机的重量，而且会占取很多飞机空间，大大影响飞机的运营能力；再说，乘客们并不是每个人都能掌握跳伞技术；最主要得是，飞机是在高空高速飞行，与一般的跳伞运动和低空立机不同，即使发生意外情况，也无法打开舱门跳伞。</p><p>　　34、头等舱与经济舱有什么区别？</p><p>　　国内外航空旅行一般分为两个等也就是头等舱和经济舱。经济舱的座位设在靠中间到机尾的地方，占机身的四分之三空间或更多一些，座位安排的比较紧。</p><p>　　对于进出拥挤的座位有困难或者不能排队等候上厕所的老年人、残疾人，或者愿意使旅行较为舒适而又承担的起的人来说，头等舱或公务舱是很有吸引力的。那里的座位宽敞，旅客可以在座位之间的桌字上打牌或者摊开自己的文件。鸡尾酒是免费的，食品更加精美，如果你想要，还可以供应香槟。乘务员只照顾10到15位旅客，所以旅客的每项要求都能立即得到满足。</p><p>　　35、乘机时怎样选择临窗座位？</p><p>　　初次乘飞机，一般都喜欢坐在靠窗户的座位呢？飞机座位从机舱前部至尾部依次为123&hellip;&hellip;排，每排由左到右分为A、B、C、D等座号。旅客办理乘机手续时，会领取一张登机牌，登机牌标明有座位号。座位号由一个阿拉伯数字和一个英文字母组成，阿拉伯数字表示座位的第几排，英文字母表示该排座位中的具体位置。例如，5A表示的是第五排的A座，12D表示12排D座，依次类推。如果您乘坐的是波音737飞机，该机每排有6个座位，由于飞机座号是按英文字母顺序排列的，因此每排座位中的A座和F座是靠近窗户的。如果你乘坐的飞机每排只有4个座位，那么每排的A座和D座则靠近窗户。初次乘飞机的旅客若希望坐在窗户边，在办理手续时，可向民航工作人员提出要求。</p><p>　　36、不定期票与定期票的区别？</p><p>　　不定期票（也称&ldquo;OPEN&rdquo;票）是指在航班、座位等级、乘机日期和起飞时间都没有订妥的机票。一般在国际航班的联程票上会有这样的情况。</p><p>　　与其相反，定期票（也称&ldquo;OK&rdquo;票）是指机票在航班、座位等级、乘机日期和起飞时间均已订妥的机票。始发站开出的客票都是&ldquo;OK&rdquo;票。</p><p>　　37、哪些行李物品不能运输？</p><p>　　1.未经安全检查的行李和物品，承运人不得运输。</p><p>　　2.国家规定的禁运物品、限制运输物品、危险物品，以及具有异味或容易污损飞机的其他物品，不能作为行李或加入行李内托运。承运人在收运行李前或在运输过程中，发现行李中装有不得作为行李或夹入行李内运输的任何物品，可以拒绝收运或随时终止运输。</p><p>　　3.旅客携带的管制刀具以外的利器或钝器，应随托运行李托运，不能随身携带。</p>',
    };
  },
  components: {
    Topbar,
    Top,
    Swiper,
  },
  methods: {
    back() {
      this.$router.push("/home/order");
    },
    async next() {
      await this.$http({
        url: "buyer",
        method: "post",
        headers: {
          Authorization: localStorage.getItem("Authorization"),
        },
        data: {
          price: this.$store.state.price,
          grade: this.$store.state.grade,
          flightId: this.$store.state.flightId,
          seat: parseInt(this.$store.state.seat),
          day: this.$store.state.day,
          passengerName: this.passengerName,
          certificate: this.certificate,
          telephone: this.telephone,
          email: this.email,
          certificateType: this.certificateType,
        },
      })
        .then(({ data: res }) => {
          if (res.msg === "success") {
            this.$message({
              message: "生成订单成功！",
              type: "success",
            });
            this.payId = res.data;
            console.log(res.data);
            this.$store.state.payId = this.payId
            this.$router.push("/home/end");
          } else {
            this.$message({
              message: "生成订单失败！",
              type: "error",
            });
            console.log(res);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style lang="less" scoped>
.pay-box {
  .payment-box {
    width: 880px;
    .payment-top {
      height: 50px;
      line-height: 50px;
      font-size: 16px;
      color: #fff;
      background-color: #2f71bd;
      padding-left: 20px;
    }
    .sub-title {
      height: 40px;
      line-height: 40px;
      font-size: 16px;
      color: #1c53a1;
      background-color: #bae2ff;
      font-size: 14px;
      padding-left: 20px;
    }
    .passengers {
      padding-left: 20px;
      height: 156px;
      background-color: #ffffff;
      .passenger {
        float: left;
        margin-top: 10px;
        width: 340px;
        height: 126px;
        border: 1px solid #e1e4e7;
        .aut {
          position: relative;
          margin-bottom: 4px;
          background-color: #f1f7fd;
          font-size: 12px;
          color: #1c53a1;
          height: 26px;
          line-height: 26px;
          text-align: center;
        }
        td {
          display: block;
          padding: 0 10px;
          line-height: 1.8;
          padding-left: 10px;
          text-align: left;
          font-weight: 400;
          font-size: 12px;
          color: #6b6b6b;
        }
      }
    }
    .tab {
      height: 300px;
      background-color: #ffffff;
      padding: 10px 20px 0 20px;
      .current {
        width: 820px;
        height: 230px;
        margin: 20px 0 0 20px;
        overflow: auto;
        background-color: #fff5e9;
        color: #a8630f;
        border: 1px solid #fdd19b;
        font-size: 14px;
      }
      .law {
        display: block;
        margin-top: 10px;
      }
    }
    .button-box {
      height: 50px;
      padding: 10px 20px 0 20px;
      .button {
        width: 150px;
        height: 38px;
      }
      .back {
        border-radius: 50px;
        background-color: #05c8ff;
        text-align: center;
        line-height: 38px;
      }
      .next {
        border-radius: 50px;
        background-color: #ff9e00;
        text-align: center;
        line-height: 38px;
      }
    }
  }
  .swiper-box {
    /deep/ img {
      width: 270px;
    }
    width: 270px;
    .tip {
      margin-top: 10px;
      height: 110px;
      background-color: #ffecca;
      padding: 20px;
      border-top: 5px solid #fd8923;
      border-bottom: 5px solid #fd8923;
      .title {
        margin-bottom: 14px;
        color: #8f5727;
        font-size: 16px;
      }
      p {
        font-size: 12px;
        color: #8f5727;
        line-height: 1.8;
      }
    }
    .advertisement {
      margin-top: 10px;
      height: 200px;
      line-height: 200px;
      text-align: center;
      background-color: #fd8923;
    }
  }
}
</style>
