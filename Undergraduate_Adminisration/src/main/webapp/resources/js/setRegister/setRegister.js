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
		//주소3
	}else if(!document.proInput.userAddr2.value){
		alert(inAddress);
		document.proInput.userAddr2.focus();
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
	//단과대 입력
	if(!document.empInput.faculty.value){
		alert(inFaculty);
		document.empInput.faculty.focus();
		return false;
		//학과입력
	}else if(!document.empInput.majorNum.value){
		alert(inMajor);
		document.empInput.email1.focus();
		return false;
		//교번입력
	}else if(!document.empInput.userNumber.value){
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
		//주소3
	}else if(!document.empInput.userAddr2.value){
		alert(inAddress);
		document.empInput.userAddr2.focus();
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

//교수 - 단과대
function nextFaculty(){
	if(document.proInput.faculty.value !=""){
		document.proInput.majorNum.focus();
	}else{
		document.proInput.faculty.focus();
	}
}

//학과
function nextMajor(){
	if(document.proInput.majorNum.value !=""){
		document.proInput.userNumber.focus();
	}else{
		document.proInput.majorNum.focus();
	}
}


//이미지
function nextImage(){
	if(document.proInput.userImage.value !=""){
		document.proInput.userName.focus();
	}else{
		document.proInput.userImage.focus();
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


//교수 - 주민번호 앞자리 : 밸류값이 6을 넘어가면 포커스 이동
function nextJumin1(){  
	if(document.proInput.jumin1.value.length >=6){
		document.proInput.jumin2.focus();
	}	
}
function nextJumin2(){
	if(document.proInput.jumin2.value.length>=7){
		document.proInput.gender.focus();
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
		document.empInput.gender.focus();
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


//이메일 -교수등록
function selectEmailChk(){
	if(document.proInput.email3.value ==0){
		document.proInput.email2.value ="";
		document.proInput.email2.focus();
	}else{
		document.proInput.email2.value =document.proInput.email3.value;
		document.proInput.zipSearch.focus();
	}
}

//이메일 - 직원
function selectEmailCHK(){
	if(document.empInput.email3.value ==0){
		document.empInput.email2.value ="";
		document.empInput.email2.focus();
	}else{
		document.empInput.email2.value =document.empInput.email3.value;
		document.empInput.zipSearch.focus();
	}
}

