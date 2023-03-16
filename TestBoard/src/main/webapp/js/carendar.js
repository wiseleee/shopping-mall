  
  function printCalendar() {
	  // 현재 시간을 구합니다.
	  var now = new Date();

	  // 현재 년, 월, 일을 구합니다.
	  var year = now.getFullYear();
	  var month = now.getMonth() + 1;
	  var date = now.getDate();

	  // 현재 월의 첫 번째 날짜를 구합니다.
	  var firstDay = new Date(year, month - 1, 1);

	  // 현재 월의 마지막 날짜를 구합니다.
	  var lastDay = new Date(year, month, 0);

	  // 달력을 출력할 테이블 요소를 가져옵니다.
	  var calendarTable = document.getElementById('calendarTable');

	  // 테이블의 내용을 초기화합니다.
	  calendarTable.innerHTML = '';

	  // 현재 년, 월을 출력합니다.
	  var header = calendarTable.createTHead();
	  var row = header.insertRow();
	  var cell = row.insertCell();
	  cell.colSpan = 7;
	  cell.style.textAlign = 'center';
	  cell.style.fontWeight = 'bold';
	  cell.textContent = year + '년 ' + month + '월';

	  // 첫 번째 행에 요일 이름을 출력합니다.
	  var weekDays = ['일', '월', '화', '수', '목', '금', '토'];
	  row = calendarTable.insertRow();
	  for (var i = 0; i < 7; i++) {
	    cell = row.insertCell();
	    cell.innerHTML = weekDays[i];
	  }

	  // 다음 행부터 날짜를 출력합니다.
	  row = calendarTable.insertRow();
	  var day = 1;
	  for (var i = 0; i < 42; i++) {
	    cell = row.insertCell();

	    if (i < firstDay.getDay() || day > lastDay.getDate()) {
	      // 현재 달력에 표시되지 않는 날짜인 경우
	      cell.innerHTML = '';
	    } else {
	      // 현재 달력에 표시되는 날짜인 경우
	      cell.innerHTML = day;
	      day++;

	      // 현재 날짜인 경우 색상을 변경합니다.
	      if (year == now.getFullYear() && month == now.getMonth() + 1 && day - 1 == now.getDate()) {
	        cell.style.backgroundColor = '#C9A0DC'; // 라벤더색
	      }
	    }

	    // 일주일이 끝나면 다음 행으로 이동합니다.
	    if (i % 7 == 6) {
	      row = calendarTable.insertRow();
	    }
	  }
	}
  