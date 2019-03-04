/**
 *  교직원 및 학생 등록 시 에 처리 되는 자바스크립트
 */

//회원가입 폼
function inputFocus(){
	document.empInput.empNumber.focus();
}



//폼에 입력값 누락시 알럿
var inDefault =" 입력해주세요.";
var inFaculty ="학부를 선택하세요.";
var inMajor = "학과를 선택하세요.";
var inEmpNum = "교직원번호"+inDefault;
var inStdNum = "학번을"+inDefault;
var inPhoto = "프로필 사진을 등록 해주세요.";
var inUserName = "이름을"+inDefault;
var inEngName = "영문이름을 "+inDefault;
var inCitizenNum = "주민번호를 "+inDefault;
var inGender = "성별을 "+inDefault;
var inUserPh = "전화번호를"+inDefault;
var inEmail ="이메일을 "+inDefault;
var inAddress ="주소를 "+inDefault;
var inBankName = "은행명을"+inDefault;
var inAccountHolder = "예금주를"+inDefault;
var inEnterDate = "입사일을"+inDefault; 
var inAccountNum = "계좌번호를" + inDefault;



//교수등록 폼태그
function proInputChk(){
	//단과대 입력
	if(!document.proInput.faculty.value){
		alert(inFaculty);
		document.proInput.faculty.focus();
		return false;
		//학과입력
	}else if(!document.proInput.majorNum.value){
		alert(inMajor);
		document.proInput.email1.focus();
		return false;
		//교번입력
	}else if(!document.proInput.userNumber.value){
		alert(inEmpNum);
		document.proInput.userNumber.focus();
		return false;
		//사진등록
	}else if(!document.proInput.userImage.value){
		alert(inPhoto);
		document.proInput.userImage.focus();
		return false;
		//한글이름
	}else if(!document.proInput.userName.value){
		alert(inUserName);
		document.proInput.userName.focus();
		return false;
		//영어이름
	}else if(!document.proInput.userEngName.value){
		alert(inEngName);
		document.proInput.userEngName.focus();
		return false;
		//주민1
	}else if(!document.proInput.jumin1.value){
		alert(inCitizenNum);
		document.proInput.jumin1.focus();
		return false;
		//주민2
	}else if(!document.proInput.jumin2.value){
		alert(inCitizenNum);
		document.proInput.jumin2.focus();
		return false;
		//성별
	}else if(!document.proInput.gender.value){
		alert(inGender);
		document.proInput.gender.focus();
		return false;
		//휴대폰1
	}else if(!document.proInput.hp1.value){
		alert(inUserPh);
		document.proInput.hp1.focus();
		return false;
		//휴대폰2
	}else if(!document.proInput.hp2.value){
		alert(inUserPh);
		document.proInput.hp2.focus();
		return false;
		//휴대폰3
	}else if(!document.proInput.hp3.value){
		alert(inUserPh);
		document.proInput.h3.focus();
		return false;

//		메일2의 값이 널이고 이메일3의 값이 0(=직접입력)인경우
	}else if(!document.proInput.email2.value &&
			!document.proInput.email3.value=="0"){
		alert(inEmail);
		document.proInput.email2.focus();
		return false;
		//주소1
	}else if(!document.proInput.userZipCode.value){
		alert(inAddress);
		document.proInput.userZipCode.focus();
		return false;
		//주소2
	}else if(!document.proInput.userAddr1.value){
		alert(inAddress);
		document.proInput.userAddr1.focus();
		return false;
	
		//은행명
	}else if(!document.proInput.bankName.value){
		alert(inBankName);
		document.proInput.bankName.focus();
		return false;
		//예금주
	}else if(!document.proInput.accountHolder.value){
		alert(inAccountHolder);
		document.proInput.accountHolder.focus();
		return false;
		//계좌번호
	}else if(!document.proInput.accountNumber.value){
		alert(inAccountNum);
		document.proInput.accountNumber.focus();
		return false;
		//입사일
	}else if(!document.proInput.empHiredDate.value){
		alert(inEnterDate);
		document.proInput.empHiredDate.focus();
		return false;
	}
}



//직원등록  폼태그
function empInputChk(){

	//교번입력
	if(!document.empInput.userNumber.value){
		alert(inEmpNum);
		document.empInput.userNumber.focus();
		return false;
		//사진등록
	}else if(!document.empInput.userImage.value){
		alert(inPhoto);
		document.empInput.userImage.focus();
		return false;
		//한글이름
	}else if(!document.empInput.userName.value){
		alert(inUserName);
		document.empInput.userName.focus();
		return false;
		//영어이름
	}else if(!document.empInput.userEngName.value){
		alert(inEngName);
		document.empInput.userEngName.focus();
		return false;
		//주민1
	}else if(!document.empInput.jumin1.value){
		alert(inCitizenNum);
		document.empInput.jumin1.focus();
		return false;
		//주민2
	}else if(!document.empInput.jumin2.value){
		alert(inCitizenNum);
		document.empInput.jumin2.focus();
		return false;
		//성별
	}else if(!document.empInput.gender.value){
		alert(inGender);
		document.empInput.gender.focus();
		return false;
		//휴대폰1
	}else if(!document.empInput.hp1.value){
		alert(inUserPh);
		document.empInput.hp1.focus();
		return false;
		//휴대폰2
	}else if(!document.empInput.hp2.value){
		alert(inUserPh);
		document.empInput.hp2.focus();
		return false;
		//휴대폰3
	}else if(!document.empInput.hp3.value){
		alert(inUserPh);
		document.empInput.h3.focus();
		return false;

//		메일2의 값이 널이고 이메일3의 값이 0(=직접입력)인경우
	}else if(!document.empInput.email2.value &&
			!document.empInput.email3.value=="0"){
		alert(inEmail);
		document.empInput.email2.focus();
		return false;
		//주소1
	}else if(!document.empInput.userZipCode.value){
		alert(inAddress);
		document.empInput.userZipCode.focus();
		return false;
		//주소2
	}else if(!document.empInput.userAddr1.value){
		alert(inAddress);
		document.empInput.userAddr1.focus();
		return false;

		//은행명
	}else if(!document.empInput.bankName.value){
		alert(inBankName);
		document.empInput.bankName.focus();
		return false;
		//예금주
	}else if(!document.empInput.accountHolder.value){
		alert(inAccountHolder);
		document.empInput.accountHolder.focus();
		return false;
		//계좌번호
	}else if(!document.empInput.accountNumber.value){
		alert(inAccountNum);
		document.empInput.accountNumber.focus();
		return false;
		//입사일
	}else if(!document.empInput.empHiredDate.value){
		alert(inEnterDate);
		document.empInput.empHiredDate.focus();
		return false;
		
	}
}

//학생등록  폼태그
function stdInputChk(){
	//단과대 입력
	if(!document.stdInput.faculty.value){
		alert(inFaculty);
		document.stdInput.faculty.focus();
		return false;
		//학과입력
	}else if(!document.stdInput.majorNum.value){
		alert(inMajor);
		document.stdInput.majorNum.focus();
		return false;
		//학기
	}else if(!document.stdInput.semester.value){
		alert("학기를 선택해주세요.");
		document.stdInput.semester.focus();
		return false;
		//학년
	}else if(!document.stdInput.grade.value){
		alert("학년을 선택해주세요.");
		document.stdInput.grade.focus();
		return false;
		//교번입력
	}else if(!document.stdInput.userNumber.value){
		alert(inEmpNum);
		document.stdInput.userNumber.focus();
		return false;
		//사진등록
	}else if(!document.stdInput.userImage.value){
		alert(inPhoto);
		document.stdInput.userImage.focus();
		return false;
		//한글이름
	}else if(!document.stdInput.userName.value){
		alert(inUserName);
		document.stdInput.userName.focus();
		return false;
		//영어이름
	}else if(!document.stdInput.userEngName.value){
		alert(inEngName);
		document.stdInput.userEngName.focus();
		return false;
		//주민1
	}else if(!document.stdInput.jumin1.value){
		alert(inCitizenNum);
		document.stdInput.jumin1.focus();
		return false;
		//주민2
	}else if(!document.stdInput.jumin2.value){
		alert(inCitizenNum);
		document.stdInput.jumin2.focus();
		return false;
		//성별
	}else if(!document.stdInput.gender.value){
		alert(inGender);
		document.stdInput.gender.focus();
		return false;
		//휴대폰1
	}else if(!document.stdInput.hp1.value){
		alert(inUserPh);
		document.stdInput.hp1.focus();
		return false;
		//휴대폰2
	}else if(!document.stdInput.hp2.value){
		alert(inUserPh);
		document.stdInput.hp2.focus();
		return false;
		//휴대폰3
	}else if(!document.stdInput.hp3.value){
		alert(inUserPh);
		document.stdInput.h3.focus();
		return false;

//		메일2의 값이 널이고 이메일3의 값이 0(=직접입력)인경우
	}else if(!document.stdInput.email2.value &&
			!document.stdInput.email3.value=="0"){
		alert(inEmail);
		document.stdInput.email2.focus();
		return false;
		//주소1
	}else if(!document.stdInput.userZipCode.value){
		alert(inAddress);
		document.stdInput.userZipCode.focus();
		return false;
		//주소2
	}else if(!document.stdInput.userAddr1.value){
		alert(inAddress);
		document.stdInput.userAddr1.focus();
		return false;

		//입학일
	}else if(!document.stdInput.adDate.value){
		alert("입학일을 입력하세요.");
		document.stdInput.adDate.focus();
		return false;
		//졸업예정일
	}else if(!document.stdInput.graDate.value){
		alert("졸업예정일을 입력하세요.");
		document.stdInput.graDate.focus();
		return false;
	}
}


//학생마이페이지  폼태그
function stdMyChk(){
	//단과대 입력
	if(!document.stdMypage.faculty.value){
		alert(inFaculty);
		document.stdMypage.faculty.focus();
		return false;
		//학과입력
	}else if(!document.stdMypage.majorNum.value){
		alert(inMajor);
		document.stdMypage.majorNum.focus();
		return false;
		//학기
	}else if(!document.stdMypage.semester.value){
		alert("학기를 선택해주세요.");
		document.stdMypage.semester.focus();
		return false;
		//학년
	}else if(!document.stdMypage.grade.value){
		alert("학년을 선택해주세요.");
		document.stdMypage.grade.focus();
		return false;
		//교번입력
	}else if(!document.stdMypage.userNumber.value){
		alert(inEmpNum);
		document.stdMypage.userNumber.focus();
		return false;
		//사진등록
	}else if(!document.stdMypage.userImage.value){
		alert(inPhoto);
		document.stdMypage.userImage.focus();
		return false;
		//한글이름
	}else if(!document.stdMypage.userName.value){
		alert(inUserName);
		document.stdMypage.userName.focus();
		return false;
		//영어이름
	}else if(!document.stdMypage.userEngName.value){
		alert(inEngName);
		document.stdMypage.userEngName.focus();
		return false;
		//주민1
	}else if(!document.stdMypage.jumin1.value){
		alert(inCitizenNum);
		document.stdMypage.jumin1.focus();
		return false;
		//주민2
	}else if(!document.stdMypage.jumin2.value){
		alert(inCitizenNum);
		document.stdMypage.jumin2.focus();
		return false;
		//성별
	}else if(!document.stdMypage.gender.value){
		alert(inGender);
		document.stdMypage.gender.focus();
		return false;
		//휴대폰1
	}else if(!document.stdMypage.hp1.value){
		alert(inUserPh);
		document.stdMypage.hp1.focus();
		return false;
		//휴대폰2
	}else if(!document.stdMypage.hp2.value){
		alert(inUserPh);
		document.stdMypage.hp2.focus();
		return false;
		//휴대폰3
	}else if(!document.stdMypage.hp3.value){
		alert(inUserPh);
		document.stdMypage.h3.focus();
		return false;

//		메일2의 값이 널이고 이메일3의 값이 0(=직접입력)인경우
	}else if(!document.stdMypage.email2.value &&
			!document.stdMypage.email3.value=="0"){
		alert(inEmail);
		document.stdMypage.email2.focus();
		return false;
		//주소1
	}else if(!document.stdMypage.userZipCode.value){
		alert(inAddress);
		document.stdMypage.userZipCode.focus();
		return false;
		//주소2
	}else if(!document.stdMypage.userAddr1.value){
		alert(inAddress);
		document.stdMypage.userAddr1.focus();
		return false;

		//졸업예정일
	}else if(!document.stdMypage.graDate.value){
		alert("졸업예정일을 입력하세요.");
		document.stdMypage.graDate.focus();
		return false;
	}
}

//교수 마이페이지  폼태그
function proMyChk(){
	//단과대 입력
	if(!document.proMypage.faculty.value){
		alert(inFaculty);
		document.proMypage.faculty.focus();
		return false;
		//학과입력
	}else if(!document.proMypage.majorNum.value){
		alert(inMajor);
		document.proMypage.majorNum.focus();
		return false;
		//교번입력
	}else if(!document.proMypage.userNumber.value){
		alert(inEmpNum);
		document.proMypage.userNumber.focus();
		return false;
		//사진등록
	}else if(!document.proMypage.userImage.value){
		alert(inPhoto);
		document.proMypage.userImage.focus();
		return false;
		//한글이름
	}else if(!document.proMypage.userName.value){
		alert(inUserName);
		document.proMypage.userName.focus();
		return false;
		//영어이름
	}else if(!document.proMypage.userEngName.value){
		alert(inEngName);
		document.proMypage.userEngName.focus();
		return false;
		//주민1
	}else if(!document.proMypage.jumin1.value){
		alert(inCitizenNum);
		document.proMypage.jumin1.focus();
		return false;
		//주민2
	}else if(!document.proMypage.jumin2.value){
		alert(inCitizenNum);
		document.proMypage.jumin2.focus();
		return false;
		//성별
	}else if(!document.proMypage.gender.value){
		alert(inGender);
		document.proMypage.gender.focus();
		return false;
		//휴대폰1
	}else if(!document.proMypage.hp1.value){
		alert(inUserPh);
		document.proMypage.hp1.focus();
		return false;
		//휴대폰2
	}else if(!document.proMypage.hp2.value){
		alert(inUserPh);
		document.proMypage.hp2.focus();
		return false;
		//휴대폰3
	}else if(!document.proMypage.hp3.value){
		alert(inUserPh);
		document.proMypage.h3.focus();
		return false;

//		메일2의 값이 널이고 이메일3의 값이 0(=직접입력)인경우
	}else if(!document.proMypage.email2.value &&
			!document.proMypage.email3.value=="0"){
		alert(inEmail);
		document.proMypage.email2.focus();
		return false;
		//주소1
	}else if(!document.proMypage.userZipCode.value){
		alert(inAddress);
		document.proMypage.userZipCode.focus();
		return false;
		//주소2
	}else if(!document.proMypage.userAddr1.value){
		alert(inAddress);
		document.proMypage.userAddr1.focus();
		return false;
		//은행명
	}else if(!document.proMypage.bankName.value){
		alert(inBankName);
		document.proMypage.bankName.focus();
		return false;
		//예금주
	}else if(!document.proMypage.accountHolder.value){
		alert(inAccountHolder);
		document.proMypage.accountHolder.focus();
		return false;
		//계좌번호
	}else if(!document.proMypage.accountNumber.value){
		alert(inAccountNum);
		document.proMypage.accountNumber.focus();
		return false;
		//입사일
	}else if(!document.proMypage.empHiredDate.value){
		alert(inEnterDate);
		document.proMypage.empHiredDate.focus();
		return false;
		//연차
	}else if(!document.proMypage.annualLevel.value){
		alert("연차를 " + inDefault);
		return false;
	}
}

//직원마이페이지  폼태그
function empMyChk(){
	
		//교번입력
	 if(!document.empMypage.userNumber.value){
		alert(inEmpNum);
		document.empMypage.userNumber.focus();
		return false;
		//사진등록
	}else if(!document.empMypage.userImage.value){
		alert(inPhoto);
		document.empMypage.userImage.focus();
		return false;
		//한글이름
	}else if(!document.empMypage.userName.value){
		alert(inUserName);
		document.empMypage.userName.focus();
		return false;
		//영어이름
	}else if(!document.empMypage.userEngName.value){
		alert(inEngName);
		document.empMypage.userEngName.focus();
		return false;
		//주민1
	}else if(!document.empMypage.jumin1.value){
		alert(inCitizenNum);
		document.empMypage.jumin1.focus();
		return false;
		//주민2
	}else if(!document.empMypage.jumin2.value){
		alert(inCitizenNum);
		document.empMypage.jumin2.focus();
		return false;
		//성별
	}else if(!document.empMypage.gender.value){
		alert(inGender);
		document.empMypage.gender.focus();
		return false;
		//휴대폰1
	}else if(!document.empMypage.hp1.value){
		alert(inUserPh);
		document.empMypage.hp1.focus();
		return false;
		//휴대폰2
	}else if(!document.empMypage.hp2.value){
		alert(inUserPh);
		document.empMypage.hp2.focus();
		return false;
		//휴대폰3
	}else if(!document.empMypage.hp3.value){
		alert(inUserPh);
		document.empMypage.h3.focus();
		return false;

//		메일2의 값이 널이고 이메일3의 값이 0(=직접입력)인경우
	}else if(!document.empMypage.email2.value &&
			!document.empMypage.email3.value=="0"){
		alert(inEmail);
		document.empMypage.email2.focus();
		return false;
		//주소1
	}else if(!document.empMypage.userZipCode.value){
		alert(inAddress);
		document.empMypage.userZipCode.focus();
		return false;
		//주소2
	}else if(!document.empMypage.userAddr1.value){
		alert(inAddress);
		document.empMypage.userAddr1.focus();
		return false;
		//은행명
	}else if(!document.empMypage.bankName.value){
		alert(inBankName);
		document.empMypage.bankName.focus();
		return false;
		//예금주
	}else if(!document.empMypage.accountHolder.value){
		alert(inAccountHolder);
		document.empMypage.accountHolder.focus();
		return false;
		//계좌번호
	}else if(!document.empMypage.accountNumber.value){
		alert(inAccountNum);
		document.empMypage.accountNumber.focus();
		return false;
		//입사일
	}else if(!document.empMypage.empHiredDate.value){
		alert(inEnterDate);
		document.empMypage.empHiredDate.focus();
		return false;
		//연차
	}else if(!document.empMypage.annualLevel.value){
		alert("연차를 " + inDefault);
		return false;
	}
}








//교수 - 단과대
function nextFaculty(){
	if(document.proInput.faculty.value !=""){
		document.proInput.majorNum.focus();
	}else{
		document.proInput.faculty.focus();
	}
}

//교수 -학과
function nextMajor(){
	if(document.proInput.majorNum.value !=""){
		document.proInput.userNumber.focus();
	}else{
		document.proInput.majorNum.focus();
	}
}

//학생 - 단과대
function nextFacultyStd(){
	if(document.stdInput.faculty.value !=""){
		document.stdInput.majorNum.focus();
	}else{
		document.stdInput.faculty.focus();
	}
}

//학생 -학과
function nextMajorStd(){
	if(document.stdInput.majorNum.value !=""){
		document.getElementById("semester1").focus();
	}else{
		document.stdInput.majorNum.focus();
	}
}


//학생 - 학기
function nextSemester(){
	if(document.stdInput.semester.value !=""){
		document.stdInput.grade[0].focus();
	}else{
		document.getElementById("semester1").focus();
	}
}



//교번 인서트
function nextProNum(){
	if(document.proInput.userNumber.value.length >=8){
		document.proInput.numberChk.focus();
	}else{
		document.proInput.userNumber.focus();
	}
}

//직원번호 인서트
function nextEmpNum(){
	if(document.empInput.userNumber.value.length >=8){
		document.empInput.EmpnumberChk.focus();
	}else{
		document.empInput.userNumber.focus();
	}
}

//학번 인서트
function nextStdNum(){
	if(document.stdInput.userNumber.value.length >=8){
		document.stdInput.numberChk.focus();
	}else{
		document.stdInput.userNumber.focus();
	}
}

//교번 마이페이지
function nextProPage(){
	if(document.proMypae.userNumber.value.length >=8){
		document.proMypae.numberChk.focus();
	}else{
		document.proMypae.userNumber.focus();
	}
}

//직원번호 마이페이지
function nextEmpPage(){
	if(document.empMypae.userNumber.value.length >=8){
		document.empMypae.EmpnumberChk.focus();
	}else{
		document.empMypae.userNumber.focus();
	}
}

//학번 마이페이지
function nextStdPage(){
	if(document.stdMypae.userNumber.value.length >=8){
		document.stdMypae.numberChk.focus();
	}else{
		document.stdMypae.userNumber.focus();
	}
}



//교수이미지
function nextImage(){
	if(document.proInput.userImage.value !=""){
		document.proInput.userName.focus();
	}else{
		document.proInput.userImage.focus();
	}
}

//직원이미지
function nextEmpImage(){
	if(document.empInput.userImage.value !=""){
		document.empInput.userName.focus();
	}else{
		document.empInput.userImage.focus();
	}
}

//학생이미지
function nextStdImage(){
	if(document.stdInput.userImage.value !=""){
		document.stdInput.userName.focus();
	}else{
		document.stdInput.userImage.focus();
	}
}

//교수 - 주민번호 앞자리 : 밸류값이 6을 넘어가면 포커스 이동
function nextJumin1(){  
	if(document.proInput.jumin1.value.length >=6){
		document.proInput.jumin2.focus();
	}	
}
function nextJumin2(){
	if(document.proInput.jumin2.value.length>=7){
		document.proInput.gender[0].focus();
	}
}


//직원 - 주민번호 앞자리 : 밸류값이 6을 넘어가면 포커스 이동
function nextJumin1Emp(){
	if(document.empInput.jumin1.value.length >=6){
		document.empInput.jumin2.focus();
	}	
}
function nextJumin2Emp(){
	if(document.empInput.jumin2.value.length>=7){
		document.empInput.gender[0].focus();
	}
}

//학생 - 주민번호 앞자리 : 밸류값이 6을 넘어가면 포커스 이동
function nextJumin1Std(){
	if(document.stdInput.jumin1.value.length >=6){
		document.stdInput.jumin2.focus();
	}	
}
function nextJumin2Std(){
	if(document.stdInput.jumin2.value.length>=7){
		document.stdInput.gender[0].focus();
	}
}



//학생 마이페이지 - 주민번호 앞자리 : 밸류값이 6을 넘어가면 포커스 이동
function stdMyPageJumin1(){
	if(document.stdMypage.jumin1.value.length >=6){
		document.stdMypage.jumin2.focus();
	}	
}
function stdMyPageJumin2(){
	if(document.stdMypage.jumin2.value.length>=7){
		document.stdMypage.gender[0].focus();
	}
}

//교수 마이페이지 - 주민번호 앞자리 : 밸류값이 6을 넘어가면 포커스 이동
function proMyPageJumin1(){
	if(document.proMypage.jumin1.value.length >=6){
		document.proMypage.jumin2.focus();
	}	
}
function proMyPageJumin2(){
	if(document.proMypage.jumin2.value.length>=7){
		document.proMypage.gender[0].focus();
	}
}

//직원 마이페이지 - 주민번호 앞자리 : 밸류값이 6을 넘어가면 포커스 이동
function empMyPageJumin1(){
	if(document.empMypage.jumin1.value.length >=6){
		document.empMypage.jumin2.focus();
	}	
}
function empMyPageJumin2(){
	if(document.empMypage.jumin2.value.length>=7){
		document.empMypage.gender[0].focus();
	}
}



//성별 to 연락처 - 교수
function nextSex(){
	if(document.proInput.gender.value !=""){
		document.proInput.hp1.focus();
	}
}

//성별 to 연락처 - 직원
function nextSexEmp(){
	if(document.empInput.gender.value !=""){
		document.empInput.hp1.focus();
	}
}


//교수 - 핸드폰 길이넘으면 포커스이동
function nextHP1(){
	if(document.proInput.hp1.value.length>=3){
		document.proInput.hp2.focus();
	}
}
function nextHP2(){
	if(document.proInput.hp2.value.length>=4){
		document.proInput.hp3.focus();
	}
}
function nextHP3(){
	if(document.proInput.hp3.value.length>=4){
		document.proInput.email1.focus();
	}
}


//직원 - 핸드폰 길이넘으면 포커스이동
function nextHP1Emp(){
	if(document.empInput.hp1.value.length>=3){
		document.empInput.hp2.focus();
	}
}
function nextHP2Emp(){
	if(document.empInput.hp2.value.length>=4){
		document.empInput.hp3.focus();
	}
}
function nextHP3Emp(){
	if(document.empInput.hp3.value.length>=4){
		document.empInput.email1.focus();
	}
}

//학생 - 핸드폰 길이넘으면 포커스이동
function nextHP1Std(){
	if(document.stdInput.hp1.value.length>=3){
		document.stdInput.hp2.focus();
	}
}
function nextHP2Std(){
	if(document.stdInput.hp2.value.length>=4){
		document.stdInput.hp3.focus();
	}
}
function nextHP3Std(){
	if(document.stdInput.hp3.value.length>=4){
		document.stdInput.email1.focus();
	}
}

//학생 마이페이지- 핸드폰 길이넘으면 포커스이동
function StdMyPagePh1(){
	if(document.stdMypage.hp1.value.length>=3){
		document.stdMypage.hp2.focus();
	}
}
function StdMyPagePh2(){
	if(document.stdMypage.hp2.value.length>=4){
		document.stdMypage.hp3.focus();
	}
}
function StdMyPagePh3(){
	if(document.stdMypage.hp3.value.length>=4){
		document.stdMypage.email1.focus();
	}
}


//교수 마이페이지 - 핸드폰 길이넘으면 포커스이동
function proMyPagePh1(){
	if(document.proMypage.hp1.value.length>=3){
		document.proMypage.hp2.focus();
	}
}
function proMyPagePh2(){
	if(document.proMypage.hp2.value.length>=4){
		document.proMypage.hp3.focus();
	}
}
function proMyPagePh3(){
	if(document.proMypage.hp3.value.length>=4){
		document.proMypage.email1.focus();
	}
}


//직원 마이페이지- 핸드폰 길이넘으면 포커스이동
function empMyPagePh1(){
	if(document.empMypage.hp1.value.length>=3){
		document.empMypage.hp2.focus();
	}
}
function empMyPagePh2(){
	if(document.empMypage.hp2.value.length>=4){
		document.empMypage.hp3.focus();
	}
}
function empMyPagePh3(){
	if(document.empMypage.hp3.value.length>=4){
		document.empMypage.email1.focus();
	}
}


//이메일 -교수등록
function selectEmailChkPro(){
	if(document.proInput.email3.value ==0){
		document.proInput.email2.value ="";
		document.proInput.email2.focus();
	}else{
		document.proInput.email2.value =document.proInput.email3.value;
		document.proInput.zipSearch.focus();
	}
}

//이메일 - 직원
function selectEmailChkEmp(){
	if(document.empInput.email3.value ==0){
		document.empInput.email2.value ="";
		document.empInput.email2.focus();
	}else{
		document.empInput.email2.value =document.empInput.email3.value;
		document.empInput.zipSearch.focus();
	}
}

//이메일 - 학생
function selectEmailChkStd(){
	if(document.stdInput.email3.value ==0){
		document.stdInput.email2.value ="";
		document.stdInput.email2.focus();
	}else{
		document.stdInput.email2.value =document.stdInput.email3.value;
		document.stdInput.zipSearch.focus();
	}
}


//이메일 - 학생 마이페이지
function stdMyPageEmailChk(){
	if(document.stdMypage.email3.value ==0){
		document.stdMypage.email2.value ="";
		document.stdMypage.email2.focus();
	}else{
		document.stdMypage.email2.value =document.stdMypage.email3.value;
		document.stdMypage.zipSearch.focus();
	}
}


//이메일 - 교수 마이페이지
function proMyPageEmailChk(){
	if(document.proMypage.email3.value ==0){
		document.proMypage.email2.value ="";
		document.proMypage.email2.focus();
	}else{
		document.proMypage.email2.value =document.proMypage.email3.value;
		document.proMypage.zipSearch.focus();
	}
}


//이메일 - 직원 마이페이지
function empMyPageEmailChk(){
	if(document.empMypage.email3.value ==0){
		document.empMypage.email2.value ="";
		document.empMypage.email2.focus();
	}else{
		document.empMypage.email2.value =document.empMypage.email3.value;
		document.empMypage.zipSearch.focus();
	}
}