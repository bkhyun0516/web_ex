//년과 월을 생성하는 함수
const $year = $("#year");
const $month = $("#month");
const $date = $("#date");

function createYearMonth() {
	const now = moment();
	
	//유저가 선택한 년도
	const year = $year.val();
	//유저가 선택한 월
	const month = $month.val();
	
	$year.empty();
	$month.empty();
	
	
	//월을 생성
	for(let i= 1;i< 13 ;i++) {
		$("<option>").text(i).prop("selected",i==month).appendTo($month);
	}//for end
	//년을 생성
	for(let i = now.year();i>=now.year()-120;i--){
		$("<option>").text(i).prop("selected",i==year).appendTo($year);
	}
	//일도 생성
	createDate();
}//createYearMonth() end

//유저가 선택한 년도와 월을 가지고 해당하는 날짜를 생성하는 함수
function createDate(){
	//유저가 선택한 년도
	const year = $year.val();
	//유저가 선택한 월
	const month = $month.val();
	//유저가 선택한 일
	const date = $date.val();
	const lastDate = moment([year,month-1]).daysInMonth();
	$date.empty();
	for(let i=1; i<=lastDate; i++){
		const $option = $("<option>").text(i)
		.prop("selected",i==date)
		.appendTo($date);
	}//for end
}

//한번만 호출입니다~
createYearMonth();

$year.change(createDate);
$month.on("change",createDate);